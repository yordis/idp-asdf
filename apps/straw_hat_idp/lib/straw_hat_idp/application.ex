defmodule StrawHat.Idp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  use Commanded.Application, otp_app: :straw_hat_idp

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      StrawHat.Idp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: StrawHat.Idp.PubSub}
      # Start a worker by calling: StrawHat.Idp.Worker.start_link(arg)
      # {StrawHat.Idp.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: StrawHat.Idp.Supervisor)
  end
end
