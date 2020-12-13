defmodule StrawHat.Idp.Entity.UserEntity do
  use StrawHat.Idp.Entity, entity_identifier: :user_id

  alias StrawHat.Idp.ValueObject.{UserProfile, UserStatus}

  embedded_schema do
    embeds_one :status, UserStatus
    embeds_one :profile, UserProfile
  end

  def apply(user, event) do
    IO.inspect(event)
    user
  end
end
