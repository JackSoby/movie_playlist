defmodule MoviePlaylist.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MoviePlaylist.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        frist_name: "some frist_name",
        last_name: "some last_name"
      })
      |> MoviePlaylist.Accounts.create_user()

    user
  end
end
