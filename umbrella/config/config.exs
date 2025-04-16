import Config

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
