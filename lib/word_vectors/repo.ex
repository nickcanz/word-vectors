defmodule WordVectors.Repo do
  use Ecto.Repo,
    otp_app: :word_vectors,
    adapter: Ecto.Adapters.Postgres
end
