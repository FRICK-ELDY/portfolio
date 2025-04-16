import Config

config :top, TopWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "1X/9v9TPzdZzyz9ChCXQZX7kCjzNhU/QNGW1Bv5tg8pOUcajOnqowI4ac0cMPUzc",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:top, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:top, ~w(--watch)]}
  ],
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"../shared/priv/gettext/.*(po)$",
      ~r"lib/top_web/(controllers|live|live_view|components)/.*(ex|heex)$"
    ]
  ]

config :top, dev_routes: true
