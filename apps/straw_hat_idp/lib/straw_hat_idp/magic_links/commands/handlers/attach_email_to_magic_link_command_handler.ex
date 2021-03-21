defmodule StrawHat.Idp.Command.AttachEmailToMagicLinkCommandHandler do
  use StrawHat.Commanded.CommandHandler

  alias StrawHat.Idp.Command.AttachEmailToMagicLinkCommand
  alias StrawHat.Idp.Entity.MagicLinkEntity
  alias StrawHat.Idp.Event.MagicLinkEmailAttached

  def handle(%MagicLinkEntity{} = _magiclink, %AttachEmailToMagicLinkCommand{} = command) do
    [
      %MagicLinkEmailAttached{
        user_id: command.user_id,
        email_id: command.email_id
      }
    ]
  end
end
