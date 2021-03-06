defmodule Habits.PageControllerTest do
  use Habits.ConnCase

  test "shows loading message", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Loading..."
  end

  test "routes everything to PageController.index", %{conn: conn} do
    conn = get conn, "/foo"
    assert html_response(conn, 200) =~ "Loading..."
  end
end
