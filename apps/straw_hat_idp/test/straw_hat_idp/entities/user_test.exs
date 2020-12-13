defmodule StrawHat.Idp.Aggregates.UserTest do
  use StrawHat.Idp.TestSupport.AggregateCase, aggregate: StrawHat.Idp.Aggregates.User

  alias StrawHat.Idp.Events.{UserCreated, MagicLinkRequested}

  describe "creating a user with magic link" do
    @tag :unit
    test "creates a user and request a magic link" do
      user_id = UUID.uuid4()
      command = build(:create_user_with_magic_link)

      command
      |> when_commands()
      |> then_events([
        %UserCreated{
          user_id: command.user_id,
          email: command.email,
          display_name: command.display_name
        },
        %MagicLinkRequested{
          email: command.email,
          user_id: user_id
        }
      ])
      |> assert_case()
    end
  end
end
