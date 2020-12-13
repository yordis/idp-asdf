defmodule StrawHat.Idp.Repo do
  use Ecto.Repo,
    otp_app: :straw_hat_idp,
    adapter: Ecto.Adapters.Postgres
end
