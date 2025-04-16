defmodule Inquiry.Repo do
  use Ecto.Repo,
    otp_app: :inquiry,
    adapter: Ecto.Adapters.Postgres
end
