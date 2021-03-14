defmodule StrawHat.Idp.Command.BlockUserCommandHandler do
  @behaviour Commanded.Commands.Handler

  alias StrawHat.Idp.Command.BlockUserCommand
  alias StrawHat.Idp.Entity.UserEntity
  alias StrawHat.Idp.Event.UserBlocked

  def handle(%UserEntity{} = user, %BlockUserCommand{} = command) do
    [
      %UserBlocked{
        user_id: command.user_id
      }
    ]
  end
end
