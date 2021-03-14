defmodule StrawHat.Idp.Command.ActivateUserCommandHandler do
  @behaviour Commanded.Commands.Handler

  alias StrawHat.Idp.Command.ActivateUserCommand
  alias StrawHat.Idp.Entity.UserEntity
  alias StrawHat.Idp.Event.UserActivated

  def handle(%UserEntity{} = user, %ActivateUserCommand{} = command) do
    [
      %UserActivated{
        user_id: command.user_id
      }
    ]
  end
end
