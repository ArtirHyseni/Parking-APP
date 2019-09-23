defmodule Parker.Repo do
  use Ecto.Repo,
    otp_app: :parker,
    adapter: Ecto.Adapters.Postgres
end
