defmodule StrawHat.Idp.Router do
  use Commanded.Commands.CompositeRouter

  router(StrawHat.Idp.Router.UserRouter)
  router(StrawHat.Idp.Router.MagicLinkRouter)
end
