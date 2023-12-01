defmodule MoviePlaylist.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MoviePlaylistWeb.Telemetry,
      # Start the Ecto repository
      MoviePlaylist.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MoviePlaylist.PubSub},
      # Start Finch
      {Finch, name: MoviePlaylist.Finch},
      # Start the Endpoint (http/https)
      MoviePlaylistWeb.Endpoint
      # Start a worker by calling: MoviePlaylist.Worker.start_link(arg)
      # {MoviePlaylist.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MoviePlaylist.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MoviePlaylistWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
