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
