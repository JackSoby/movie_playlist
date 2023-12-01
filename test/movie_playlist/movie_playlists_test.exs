defmodule MoviePlaylist.MoviePlaylistsTest do
  use MoviePlaylist.DataCase

  alias MoviePlaylist.MoviePlaylists

  describe "movies" do
    alias MoviePlaylist.MoviePlaylists.Movie

    import MoviePlaylist.MoviePlaylistsFixtures

    @invalid_attrs %{name: nil, genre: nil, duration: nil, user_id: nil}

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert MoviePlaylists.list_movies() == [movie]
    end

    test "list_movies_by_user_id/0 returns all movies based on given user id" do
      movie = movie_fixture()

      assert MoviePlaylists.list_movies(movie.user_id) == [movie]
    end

    test "list_movies_by_user_id/0 returns no with invalid user id" do
      movie = movie_fixture()

      assert MoviePlaylists.list_movies(500) == []
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert MoviePlaylists.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      valid_attrs = %{name: "some name", genre: "some genre", duration: 42, user_id: 42}

      assert {:ok, %Movie{} = movie} = MoviePlaylists.create_movie(valid_attrs)
      assert movie.name == "some name"
      assert movie.genre == "some genre"
      assert movie.duration == 42
      assert movie.user_id == 42
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MoviePlaylists.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      update_attrs = %{name: "some updated name", genre: "some updated genre", duration: 43, user_id: 43}

      assert {:ok, %Movie{} = movie} = MoviePlaylists.update_movie(movie, update_attrs)
      assert movie.name == "some updated name"
      assert movie.genre == "some updated genre"
      assert movie.duration == 43
      assert movie.user_id == 43
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = MoviePlaylists.update_movie(movie, @invalid_attrs)
      assert movie == MoviePlaylists.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = MoviePlaylists.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> MoviePlaylists.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = MoviePlaylists.change_movie(movie)
    end
  end
end
