import Config

config :inquiry,
  ecto_repos: [Inquiry.Repo],
  generators: [timestamp_type: :utc_datetime]

config :inquiry, InquiryWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: InquiryWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Inquiry.PubSub,
  live_view: [signing_salt: "cx6UkmaJ"]

config :esbuild,
  version: "0.17.11",
  inquiry: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.4.3",
  inquiry: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]
