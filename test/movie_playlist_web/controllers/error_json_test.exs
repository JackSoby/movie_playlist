defmodule MoviePlaylistWeb.ErrorJSONTest do
  use MoviePlaylistWeb.ConnCase, async: true

  test "renders 404" do
    assert MoviePlaylistWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert MoviePlaylistWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
