defmodule MoviePlaylist.MoviePlaylistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MoviePlaylist.MoviePlaylists` context.
  """

  @doc """
  Generate a movie.
  """
  def movie_fixture(attrs \\ %{}) do
    {:ok, movie} =
      attrs
      |> Enum.into(%{
        duration: 42,
        genre: "some genre",
        name: "some name",
        user_id: 42
      })
      |> MoviePlaylist.MoviePlaylists.create_movie()

    movie
  end
end
