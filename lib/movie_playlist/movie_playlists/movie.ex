defmodule MoviePlaylist.MoviePlaylists.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movies" do
    field :name, :string
    field :genre, :string
    field :duration, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:name, :genre, :duration, :user_id])
    |> validate_required([:name, :genre, :duration, :user_id])
    |> unique_constraint([:name])
  end
end
