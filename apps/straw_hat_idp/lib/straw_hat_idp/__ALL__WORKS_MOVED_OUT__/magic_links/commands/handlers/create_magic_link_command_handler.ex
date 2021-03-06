defmodule StrawHat.Idp.CommandHandler.CreateMagicLinkCommandHandler do
  use StrawHat.Commanded.CommandHandler

  alias StrawHat.Idp.Command.CreateMagicLinkCommand
  alias StrawHat.Idp.Entity.MagicLinkEntity
  alias StrawHat.Idp.Event.MagicLinkCreated

  def handle(%MagicLinkEntity{} = _magiclink, %CreateMagicLinkCommand{} = command) do
    [
      %MagicLinkCreated{
        user_id: command.user_id,
        token: command.token,
        ttl: command.ttl,
        email: command.email
      }
    ]
  end
end
