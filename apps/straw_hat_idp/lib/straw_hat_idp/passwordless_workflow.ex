defmodule StrawHat.Idp.EventHandlers.PasswordlessWorkflow do
  use Commanded.Event.Handler,
    application: StrawHat.Idp.Application,
    name: __MODULE__,
    start_from: :current

  alias StrawHat.Response
  alias StrawHat.Idp.Users
  alias StrawHat.Idp.MagicLinks
  alias StrawHat.Idp.Emails
  alias StrawHat.Idp.Event.{UserProvisioned, MagicLinkCreated, MagicLinkConsumed}

  def handle(%UserProvisioned{activation_workflow: %{magic_link: nil}} = _event, _metadata) do
    :ok
  end

  def handle(%UserProvisioned{activation_workflow: %{magic_link: _magic_link}} = event, _metadata) do
    MagicLinks.create_magic_link(%{user_id: event.user_id})
  end

  def handle(%MagicLinkCreated{} = event, _metadata) do
    event.email
    |> Emails.magic_link(event.token)
    |> Response.and_then(&attach_user_id_to_email(&1, event))
    |> Response.and_then(&MagicLinks.attach_email_to_magic_link/1)
  end

  def handle(%MagicLinkConsumed{} = event, _metadata) do
    with :ok <- Users.verify_user_login(event),
         :ok <- MagicLinks.create_session_from_magic_link(event),
         do: :ok
  end

  def attach_user_id_to_email(email, event) do
    email
    |> Map.put(:user_id, event.user_id)
    |> Response.ok()
  end
end
