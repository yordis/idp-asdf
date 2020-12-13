defmodule StrawHat.Idp.Router do
  use Commanded.Commands.Router

  alias StrawHat.Idp.Entity.{UserEntity, MagicLinkEntity}

  identify(UserEntity, by: :user_id, prefix: "user-")
  identify(MagicLinkEntity, by: :user_id, prefix: "magiclink-")

  dispatch(StrawHat.Idp.Command.CreateUserCommand,
    to: StrawHat.Idp.CommandHandler.CreateUserCommandHandler,
    aggregate: UserEntity
  )

  dispatch(StrawHat.Idp.Command.VerifyUserLoginCommand,
    to: StrawHat.Idp.Command.VerifyUserLoginCommandHandler,
    aggregate: UserEntity
  )

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
