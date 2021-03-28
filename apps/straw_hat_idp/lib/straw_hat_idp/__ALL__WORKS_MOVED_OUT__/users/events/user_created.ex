defmodule StrawHat.Idp.Event.UserCreated do
  use StrawHat.Commanded.ValueObject

  alias StrawHat.Idp.ValueObject.UserProfile

  embedded_schema do
    field :user_id, :string
    embeds_one :profile, UserProfile
  end
end
