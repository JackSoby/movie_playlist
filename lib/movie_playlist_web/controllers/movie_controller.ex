defmodule MoviePlaylistWeb.MovieController do
  use MoviePlaylistWeb, :controller
  alias  MoviePlaylist.MoviePlaylists

  def index(conn, %{"user_id" => user_id}) do
    movies = MoviePlaylists.list_movies_by_user_id(user_id)

    render(conn, :index, movies: movies, user_id: user_id, token: get_csrf_token(), layout: false)
  end

  def create(conn, %{"name" => _name, "user_id" => user_id, "duration" => _duration, "genre" => _genre} = params) do
    case MoviePlaylists.create_movie(params) do
      {:ok, _movie} ->
        movies = MoviePlaylists.list_movies_by_user_id(user_id)

        render(conn, :index, movies: movies, user_id: user_id, token: get_csrf_token(), layout: false)
      {:error, error} ->
        IO.inspect(error)
        movies = MoviePlaylists.list_movies_by_user_id(user_id)

        render(conn, :index, movies: movies, user_id: user_id, token: get_csrf_token(), layout: false)
    end
  end


  def delete(conn, %{"movie_id" => movie_id, "user_id" => user_id}) do
   with {:ok, _result} <- movie_id
    |> MoviePlaylists.get_movie!()
    |> MoviePlaylists.delete_movie() do
      movies = MoviePlaylists.list_movies_by_user_id(user_id)

      render(conn, :index, movies: movies, user_id: user_id, token: get_csrf_token(), layout: false)
    end
  end
end
