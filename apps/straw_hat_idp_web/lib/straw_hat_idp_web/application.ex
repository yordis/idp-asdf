defmodule StrawHat.IdpWeb.Application do
  use Application

  def start(_type, _args) do
    children = [
      StrawHat.IdpWeb.Telemetry,
      StrawHat.IdpWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: StrawHat.IdpWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    StrawHat.IdpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
