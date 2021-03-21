defmodule StrawHat.Idp.Command.ConsumeMagicLinkCommandHandler do
  use StrawHat.Commanded.CommandHandler

  alias StrawHat.Idp.Command.ConsumeMagicLinkCommand
  alias StrawHat.Idp.Entity.MagicLinkEntity
  alias StrawHat.Idp.Event.MagicLinkConsumed

  def handle(%MagicLinkEntity{} = _magiclink, %ConsumeMagicLinkCommand{} = command) do
    [
      %MagicLinkConsumed{
        user_id: command.user_id
      }
    ]
  end
end
