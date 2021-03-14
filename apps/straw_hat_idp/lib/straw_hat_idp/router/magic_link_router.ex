defmodule StrawHat.Idp.Router.MagicLinkRouter do
  use Commanded.Commands.Router

  alias StrawHat.Idp.Entity.MagicLinkEntity

  identify(MagicLinkEntity, by: :user_id, prefix: "magiclink-")

  dispatch(StrawHat.Idp.Command.CreateMagicLinkCommand,
    to: StrawHat.Idp.CommandHandler.CreateMagicLinkCommandHandler,
    aggregate: MagicLinkEntity
  )

  dispatch(StrawHat.Idp.Command.AttachEmailToMagicLinkCommand,
    to: StrawHat.Idp.Command.AttachEmailToMagicLinkCommandHandler,
    aggregate: MagicLinkEntity
  )

  dispatch(StrawHat.Idp.Command.ConsumeMagicLinkCommand,
    to: StrawHat.Idp.Command.ConsumeMagicLinkCommandHandler,
    aggregate: MagicLinkEntity
  )
end
