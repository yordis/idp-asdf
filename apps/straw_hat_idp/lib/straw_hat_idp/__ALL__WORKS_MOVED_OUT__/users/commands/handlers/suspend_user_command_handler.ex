defmodule StrawHat.Idp.Command.SuspendUserCommandHandler do
  use StrawHat.Commanded.CommandHandler

  alias StrawHat.Idp.Command.SuspendUserCommand
  alias StrawHat.Idp.Entity.UserEntity
  alias StrawHat.Idp.Event.UserSuspended

  def handle(%UserEntity{} = _user, %SuspendUserCommand{} = command) do
    [
      %UserSuspended{
        user_id: command.user_id
      }
    ]
  end
end
