defmodule StrawHat.Idp.Command.VerifyUserLoginCommandHandler do
  use StrawHat.Commanded.CommandHandler

  alias StrawHat.Idp.Command.VerifyUserLoginCommand
  alias StrawHat.Idp.Entity.UserEntity
  alias StrawHat.Idp.Event.UserLoginVerified

  def handle(%UserEntity{} = _user, %VerifyUserLoginCommand{} = command) do
    [
      %UserLoginVerified{
        user_id: command.user_id
      }
    ]
  end
end
