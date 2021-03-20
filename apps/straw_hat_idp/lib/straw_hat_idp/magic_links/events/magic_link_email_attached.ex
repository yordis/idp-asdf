defmodule StrawHat.Idp.Event.MagicLinkEmailAttached do
  use StrawHat.Idp.ValueObject

  embedded_schema do
    field :user_id, :string
    field :email_id, :string
  end
end
