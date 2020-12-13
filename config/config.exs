use Mix.Config

config :vex,
  sources: [
    StrawHat.Idp.Validators,
    Vex.Validators
  ]

config :straw_hat_idp, event_stores: [StrawHat.Idp.EventStore]

config :commanded_ecto_projections, repo: StrawHat.Idp.Repo

config :straw_hat_idp,
  namespace: StrawHat.Idp,
  ecto_repos: [StrawHat.Idp.Repo]

config :straw_hat_idp_web,
  namespace: StrawHat.IdpWeb,
  ecto_repos: [StrawHat.Idp.Repo],
  generators: [context_app: :straw_hat_idp, binary_id: true]

config :straw_hat_idp_web, StrawHat.IdpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4kr4tG0kzDCf59cMYnRP5Ev5RmLaWV0K8n1GsX4a+wODmQ0tknU3m80R1Lhl4ti4",
  render_errors: [view: StrawHat.IdpWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: StrawHat.Idp.PubSub,
  live_view: [signing_salt: "1aq1uQAD"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
