defmodule StrawHat.Idp.Command.DeactivateUserCommandHandler do
  use StrawHat.Commanded.CommandHandler

  alias StrawHat.Idp.Command.DeactivateUserCommand
  alias StrawHat.Idp.Entity.UserEntity
  alias StrawHat.Idp.Event.UserDeactivated

  def handle(%UserEntity{} = _user, %DeactivateUserCommand{} = command) do
    [
      %UserDeactivated{
        user_id: command.user_id
      }
    ]
  end
end
