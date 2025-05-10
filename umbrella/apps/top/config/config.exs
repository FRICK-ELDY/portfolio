import Config

config :top,
  generators: [timestamp_type: :utc_datetime]

config :top, TopWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: TopWeb.ErrorHTML, json: TopWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Top.PubSub,
  live_view: [signing_salt: "ddHZhuSC"]

config :top, Top.Mailer, adapter: Swoosh.Adapters.Local
