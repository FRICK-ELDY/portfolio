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

config :esbuild,
  version: "0.17.11",
  top: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.4.3",
  top: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]
