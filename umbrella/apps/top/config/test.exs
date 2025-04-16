import Config

config :top, TopWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "olmo8RWcJoQ665rw1tU5yIAYZu1Wn/mVeHd2tgZk5V0jTMVcRecd2vY9iwxpNiwP",
  server: false

config :top, Top.Mailer, adapter: Swoosh.Adapters.Test

config :swoosh, :api_client, false
