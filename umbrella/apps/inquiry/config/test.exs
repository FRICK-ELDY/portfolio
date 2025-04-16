import Config

config :inquiry, Inquiry.Repo,
  username: System.get_env("POSTGRES_USER", "postgres"),
  password: System.get_env("POSTGRES_PASSWORD", "postgres"),
  hostname: System.get_env("POSTGRES_HOST", "localhost"),
  database: "inquiry_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

config :inquiry, InquiryWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4011],
  secret_key_base: "5i9vw6CB7kfPop0IDX5kkafoX4qo/FFxiyAqBHN2uY7h1t+d51A/xXRy1VesrDeF",
  server: false
