defmodule StrawHat.Idp.Entity.SessionEntity do
  use StrawHat.Idp.Entity, entity_identifier: :session_id
  use StrawHat.Idp.Aggregate

  embedded_schema do
    field :access_token, :string
    field :refresh_token, :string
    field :user_id, :string
    field :active, :boolean
    field :expires_at, :boolean
  end

  # {
  #   "access_token":"eyJz93a...k4laUWw",
  #   "refresh_token":"GEbRxBN...edjnXbL",
  #   "id_token":"eyJ0XAi...4faeEoQ",
  #   "token_type":"Bearer",
  #   "expires_in":86400
  # }

  def apply(session, event) do
    IO.inspect(event)
    session
  end

  @spec should_refresh?(t()) :: boolean()
  def should_refresh?(%{expires_at: expires_at}) do
    {:ok, dt, _} = DateTime.from_iso8601(expires_at)

    case DateTime.diff(dt, DateTime.utc_now()) do
      n when n < 15 * 60 -> true
      _ -> false
    end
  end

  @spec expires_at(integer()) :: String.t()
  def expires_at(expires_in) do
    DateTime.utc_now()
    |> DateTime.add(expires_in)
    |> DateTime.to_string()
  end

  @spec expired?(t()) :: boolean()
  def expired?(%{expires_at: expires_at}) do
    {:ok, dt, _} = DateTime.from_iso8601(expires_at)

    case DateTime.diff(dt, DateTime.utc_now(), :second) do
      n when n <= 0 -> true
      _ -> false
    end
  end
end
