defmodule MoviePlaylist.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :name, :string
      add :genre, :string
      add :duration, :integer
      add :user_id, :integer

      timestamps()
    end
  end
end
