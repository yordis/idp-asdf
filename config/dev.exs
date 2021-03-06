use Mix.Config

config :straw_hat_idp, StrawHat.Idp.Application,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: StrawHat.Idp.EventStore
  ]

config :straw_hat_idp, StrawHat.Idp.Repo,
  username: "postgres",
  password: "postgres",
  database: "straw_hat_idp_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :straw_hat_idp, StrawHat.Idp.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "straw_hat_idp_eventstore_dev",
  hostname: "localhost",
  pool_size: 10

config :straw_hat_idp_web, StrawHat.IdpWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :plug_init_mode, :runtime

config :phoenix, :stacktrace_depth, 20

config :straw_hat_idp, StrawHat.Idp.Mailer, adapter: Bamboo.LocalAdapter
