import Config

config :inquiry, Inquiry.Repo,
  url: System.get_env("DATABASE_URL_DEV"),
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :inquiry, InquiryWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4001],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "VbtMln3/Rgnderp/dqqDVJUW1CLoI/9ukD59zxsiRMG7rYiFqvVRslbmfxzQjci4",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:inquiry, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:inquiry, ~w(--watch)]}
  ],
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"lib/inquiry_web/(controllers|live|components)/.*(ex|heex)$",
      ~r"lib/inquiry/.*(ex)$"
    ]
  ]

config :inquiry, dev_routes: true
