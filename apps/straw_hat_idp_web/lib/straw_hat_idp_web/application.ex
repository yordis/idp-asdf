defmodule StrawHat.IdpWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      StrawHat.IdpWeb.Telemetry,
      # Start the Endpoint (http/https)
      StrawHat.IdpWeb.Endpoint
      # Start a worker by calling: StrawHat.IdpWeb.Worker.start_link(arg)
      # {StrawHat.IdpWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StrawHat.IdpWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    StrawHat.IdpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
