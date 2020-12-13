use Mix.Config

config :straw_hat_idp, StrawHat.Idp.Application,
  event_store: [
    adapter: Commanded.EventStore.Adapters.InMemory,
    event_store: StrawHat.Idp.EventStore
  ]

config :commanded, Commanded.EventStore.Adapters.InMemory,
  serializer: Commanded.Serialization.JsonSerializer

config :straw_hat_idp, StrawHat.Idp.Repo,
  username: "postgres",
  password: "postgres",
  database: "straw_hat_idp_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :straw_hat_idp_web, StrawHat.IdpWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
