import Config

config :logger, level: :warning

config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  enable_expensive_runtime_checks: true

apps = Code.eval_file("apps_list.exs", __DIR__) |> elem(0)

for app <- apps do
  path = Path.expand("../apps/#{app}/config/test.exs", __DIR__)
  if File.exists?(path), do: import_config(path)
end
