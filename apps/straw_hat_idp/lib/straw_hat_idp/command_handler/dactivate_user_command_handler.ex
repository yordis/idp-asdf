defmodule StrawHat.Idp.Command.DeactivateUserCommandHandler do
  @behaviour Commanded.Commands.Handler

  alias StrawHat.Idp.Command.DeactivateUserCommand
  alias StrawHat.Idp.Entity.UserEntity
  alias StrawHat.Idp.Event.UserDeactivated

  def handle(%UserEntity{} = user, %DeactivateUserCommand{} = command) do
    [
      %UserDeactivated{
        user_id: command.user_id
      }
    ]
  end
end
