defmodule StrawHat.Idp.Entity.SessionEntity do
  use StrawHat.Idp.Entity, entity_identifier: :user_id

  embedded_schema do
    field :access_token, :string
    field :refresh_token, :string
  end

  def apply(session, event) do
    IO.inspect(event)
    session
  end
end
