defmodule StrawHat.Idp.Command.ActivateUserCommandHandler do
  use StrawHat.Commanded.CommandHandler

  alias StrawHat.Idp.Command.ActivateUserCommand
  alias StrawHat.Idp.Entity.UserEntity
  alias StrawHat.Idp.Event.UserActivated

  def handle(%UserEntity{} = _user, %ActivateUserCommand{} = command) do
    [
      %UserActivated{
        user_id: command.user_id
      }
    ]
  end
end
