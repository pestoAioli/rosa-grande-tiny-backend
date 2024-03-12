defmodule RosaGrande.Repo do
  use Ecto.Repo,
    otp_app: :rosa_grande,
    adapter: Ecto.Adapters.Postgres
end
