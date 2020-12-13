defmodule StrawHat.Idp.Application do
  use Commanded.Application, otp_app: :straw_hat_idp
  router(StrawHat.Idp.Router)
end
