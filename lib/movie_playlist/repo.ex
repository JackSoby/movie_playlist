defmodule MoviePlaylist.Repo do
  use Ecto.Repo,
    otp_app: :movie_playlist,
    adapter: Ecto.Adapters.Postgres
end
