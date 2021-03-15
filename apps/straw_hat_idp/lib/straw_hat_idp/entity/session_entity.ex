defmodule StrawHat.Idp.Entity.SessionEntity do
  use StrawHat.Idp.Entity, entity_identifier: :session_id

  embedded_schema do
    field :access_token, :string
    field :refresh_token, :string
    field :subject, :string
  end

  def apply(session, event) do
    IO.inspect(event)
    session
  end
end
