defmodule StrawHat.Idp.Event.MagicLinkCreated do
  use StrawHat.Commanded.ValueObject

  embedded_schema do
    field :user_id, :string
    field :token, :string
    field :ttl, :string
    field :email, :string
  end
end
