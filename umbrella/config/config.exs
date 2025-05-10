import Config

asset_apps = ~w(top inquiry)a
config :esbuild, ersion: "0.17.11"
config :tailwind, version: "3.4.3"

for app <- asset_apps do
  config :esbuild, app,
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../../#{app}/priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/#{app}/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}

  config :tailwind, app,
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../../#{app}/priv/static/assets/app.css
    ),
    cd: Path.expand("../apps/#{app}/assets", __DIR__)
end

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

apps = Code.eval_file("apps_list.exs", __DIR__) |> elem(0)

for app <- apps do
  config_path = Path.expand("../apps/#{app}/config/config.exs", __DIR__)
  if File.exists?(config_path), do: import_config(config_path)
end

import_config "#{config_env()}.exs"
