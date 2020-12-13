defmodule StrawHat.Idp.Event.UserStaged do
  use StrawHat.Idp.ValueObject

  embedded_schema do
    field :user_id, :string
  end
end
