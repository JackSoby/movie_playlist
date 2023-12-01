defmodule MoviePlaylist.Repo.Migrations.AddUnqiueNameConstraintMovie do
  use Ecto.Migration

  def change do
    create unique_index(:movies, [:name])

  end
end
