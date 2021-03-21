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

  def apply(session, event) do
    IO.inspect(event)
    session
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
