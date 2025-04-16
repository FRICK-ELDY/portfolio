import Config

config :top, TopWeb.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"

config :swoosh,
  api_client: Swoosh.ApiClient.Finch,
  finch_name: Top.Finch,
  local: false
