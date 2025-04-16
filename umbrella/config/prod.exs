import Config

config :logger, level: :info

apps = Code.eval_file("apps_list.exs", __DIR__) |> elem(0)

for app <- apps do
  path = Path.expand("../apps/#{app}/config/prod.exs", __DIR__)
  if File.exists?(path), do: import_config(path)
end
