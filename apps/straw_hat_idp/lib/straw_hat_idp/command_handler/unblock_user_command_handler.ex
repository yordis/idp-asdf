defmodule StrawHat.Idp.Command.UnBlockUserCommandHandler do
  @behaviour Commanded.Commands.Handler

  alias StrawHat.Idp.Command.UnBlockUserCommand
  alias StrawHat.Idp.Entity.UserEntity
  alias StrawHat.Idp.Event.UserUnBlocked

  def handle(%UserEntity{} = user, %UnBlockUserCommand{} = command) do
    [
      %UserUnBlocked{
        user_id: command.user_id
      }
    ]
  end
end
