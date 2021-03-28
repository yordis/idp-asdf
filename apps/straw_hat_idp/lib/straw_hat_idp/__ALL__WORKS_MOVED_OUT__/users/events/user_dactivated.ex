defmodule StrawHat.Idp.Event.UserDeactivated do
  use StrawHat.Commanded.ValueObject

  embedded_schema do
    field :user_id, :string
  end
end
