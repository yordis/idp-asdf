defmodule StrawHat.Idp.Command.AttachEmailToMagicLinkCommandHandler do
  @behaviour Commanded.Commands.Handler

  alias StrawHat.Idp.Command.AttachEmailToMagicLinkCommand
  alias StrawHat.Idp.Entity.MagicLinkEntity
  alias StrawHat.Idp.Event.MagicLinkEmailAttached

  def handle(%MagicLinkEntity{} = magiclink, %AttachEmailToMagicLinkCommand{} = command) do
    [
      %MagicLinkEmailAttached{
        user_id: command.user_id,
        email_id: command.email_id
      }
    ]
  end
end
