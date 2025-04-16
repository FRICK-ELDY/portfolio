import Config

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  debug_heex_annotations: true,
  enable_expensive_runtime_checks: true

config :swoosh, :api_client, false

apps = Code.eval_file("apps_list.exs", __DIR__) |> elem(0)

for app <- apps do
  path = Path.expand("../apps/#{app}/config/dev.exs", __DIR__)
  if File.exists?(path), do: import_config(path)
end
