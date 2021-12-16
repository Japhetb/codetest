defmodule Codetest.Repo do
  use Ecto.Repo,
    otp_app: :codetest,
    adapter: Ecto.Adapters.Postgres
end
