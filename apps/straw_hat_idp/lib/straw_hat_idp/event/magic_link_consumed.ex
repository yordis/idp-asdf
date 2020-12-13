defmodule StrawHat.Idp.Event.MagicLinkConsumed do
  use StrawHat.Idp.ValueObject

  embedded_schema do
    field :user_id, :string
    field :session_id, :string
  end
end
