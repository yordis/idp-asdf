defmodule StrawHat.Idp.Command.SuspendUserCommandHandler do
  @behaviour Commanded.Commands.Handler

  alias StrawHat.Idp.Command.SuspendUserCommand
  alias StrawHat.Idp.Entity.UserEntity
  alias StrawHat.Idp.Event.UserSuspended

  def handle(%UserEntity{} = user, %SuspendUserCommand{} = command) do
    [
      %UserSuspended{
        user_id: command.user_id
      }
    ]
  end
end
