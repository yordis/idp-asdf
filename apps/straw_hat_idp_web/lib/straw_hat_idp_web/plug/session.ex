defmodule Strawhat.IdpWeb.Plug.Session do
  require Logger

  alias Plug.Conn
  alias StrawHat.Idp.Entity.SessionEntity, as: Session

  def init(opts), do: opts

  def call(conn, _opts) do
    case session(conn) do
      %Session{} = session ->
        set_session(conn, session)

      nil ->
        Conn.assign(conn, :current_user, nil)

      {:error, :timeout} ->
        msg = "There was a problem fetching your member details. Please refresh the page or try logging in again"

        conn
        |> Phoenix.Controller.put_flash(:info, msg)
        |> Conn.assign(:current_user, nil)

      err ->
        Logger.error(fn -> "Unexpected error while building session -> #{err}" end)
        Conn.assign(conn, :current_user, nil)
    end
  end

  defp set_session(conn, session) do
    case Session.expired?(session) do
      true ->
        purge_session(conn, session)

      false ->
        conn
        |> maybe_refresh_token(session)
        |> Conn.assign(:current_session, session)
        |> Conn.assign(:current_user, session.member)
    end
  end

  defp maybe_refresh_token(conn, session) do
    case Session.should_refresh?(session) do
      true ->
        case Session.refresh(session) do
          {:ok, new} ->
            store_session(conn, new)

          _ ->
            {:error, :unknown}
        end

      _ ->
        conn
    end
  end

  defp session(conn) do
    conn
    |> Conn.get_session("idp_session")
    |> Session.new()
  end

  defp store_session(conn, session) do
    conn
    |> Conn.configure_session(renew: true)
    |> Conn.put_session("idp_session", session)
  end

  defp purge_session(conn, session) do
    Session.logout(session)

    conn
    |> Conn.delete_session("idp_session")
    |> Conn.assign(:current_user, nil)
    |> Phoenix.Controller.redirect(to: "/")
    |> Conn.halt()
  end
end
