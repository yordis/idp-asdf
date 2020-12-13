defmodule StrawHat.Idp.Event.UserCreated do
  use StrawHat.Idp.ValueObject

  alias StrawHat.Idp.ValueObject.UserProfile
  alias StrawHat.Idp.ValueObject.UserStatus

  embedded_schema do
    field :user_id, :string
    embeds_one :profile, UserProfile
  end
end
