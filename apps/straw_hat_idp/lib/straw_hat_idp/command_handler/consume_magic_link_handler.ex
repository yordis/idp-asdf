defmodule StrawHat.Idp.Command.ConsumeMagicLinkCommandHandler do
  @behaviour Commanded.Commands.Handler

  alias StrawHat.Idp.Command.ConsumeMagicLinkCommand
  alias StrawHat.Idp.Entity.MagicLinkEntity
  alias StrawHat.Idp.Event.MagicLinkConsumed

  def handle(%MagicLinkEntity{} = magiclink, %ConsumeMagicLinkCommand{} = command) do
    [
      %MagicLinkConsumed{
        user_id: command.user_id
      }
    ]
  end
end
