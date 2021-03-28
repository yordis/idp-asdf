defmodule StrawHat.Idp.Event.MagicLinkEmailAttached do
  use StrawHat.Commanded.ValueObject

  embedded_schema do
    field :user_id, :string
    field :email_id, :string
  end
end
