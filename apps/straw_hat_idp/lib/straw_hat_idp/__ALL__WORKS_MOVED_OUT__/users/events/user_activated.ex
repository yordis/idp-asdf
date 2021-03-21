defmodule StrawHat.Idp.Event.UserActivated do
  use StrawHat.Idp.ValueObject

  embedded_schema do
    field :user_id, :string
  end
end
