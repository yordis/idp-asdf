defmodule StrawHat.Idp.Command.VerifyUserLoginCommandHandler do
  @behaviour Commanded.Commands.Handler

  alias StrawHat.Idp.Command.VerifyUserLoginCommand
  alias StrawHat.Idp.Entity.UserEntity
  alias StrawHat.Idp.Event.UserLoginVerified

  def handle(%UserEntity{} = user, %VerifyUserLoginCommand{} = command) do
    [
      %UserLoginVerified{
        user_id: command.user_id
      }
    ]
  end
end
