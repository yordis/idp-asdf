defmodule StrawHat.Idp.TestSupport.Factory do
  use ExMachina

  alias StrawHat.Idp.Commands.CreateUserWithMagicLink

  def create_user_with_magic_link_factory do
    %CreateUserWithMagicLink{
      user_id: UUID.uuid4(),
      email: Faker.Internet.email(),
      display_name: Faker.Person.name()
    }
  end
end
