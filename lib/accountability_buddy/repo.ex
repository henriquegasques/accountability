defmodule AccountabilityBuddy.Repo do
  use Ecto.Repo,
    otp_app: :accountability_buddy,
    adapter: Ecto.Adapters.Postgres
end
