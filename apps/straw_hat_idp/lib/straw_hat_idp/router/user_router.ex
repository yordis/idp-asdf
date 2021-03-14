defmodule StrawHat.Idp.Router.UserRouter do
  use Commanded.Commands.Router

  alias StrawHat.Idp.Entity.UserEntity

  identify(UserEntity, by: :user_id, prefix: "user-")

  dispatch(StrawHat.Idp.Command.CreateUserCommand,
    to: StrawHat.Idp.CommandHandler.CreateUserCommandHandler,
    aggregate: UserEntity
  )

  dispatch(StrawHat.Idp.Command.ActivateUserCommand,
    to: StrawHat.Idp.CommandHandler.ActivateUserCommandHandler,
    aggregate: UserEntity
  )

  dispatch(StrawHat.Idp.Command.DeactivateUserCommand,
    to: StrawHat.Idp.CommandHandler.DeactivateUserCommandHandler,
    aggregate: UserEntity
  )

  dispatch(StrawHat.Idp.Command.VerifyUserLoginCommand,
    to: StrawHat.Idp.Command.VerifyUserLoginCommandHandler,
    aggregate: UserEntity
  )

  dispatch(StrawHat.Idp.Command.SuspendUserCommand,
    to: StrawHat.Idp.Command.SuspendUserCommandHandler,
    aggregate: UserEntity
  )

  dispatch(StrawHat.Idp.Command.BlockUserCommand,
    to: StrawHat.Idp.Command.BlockUserCommandHandler,
    aggregate: UserEntity
  )

  dispatch(StrawHat.Idp.Command.UnBlockUserCommand,
    to: StrawHat.Idp.Command.UnBlockUserCommandHandler,
    aggregate: UserEntity
  )
end
