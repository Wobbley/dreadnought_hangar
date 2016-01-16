defmodule DreadnoughtHangar.ShipControllerTest do
  use DreadnoughtHangar.ConnCase

  alias DreadnoughtHangar.Ship
  @valid_attrs %{armor: 42, class: "some content", icon_uri: "some content", name: "some content", subclass: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, ship_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing ships"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, ship_path(conn, :new)
    assert html_response(conn, 200) =~ "New ship"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, ship_path(conn, :create), ship: @valid_attrs
    assert redirected_to(conn) == ship_path(conn, :index)
    assert Repo.get_by(Ship, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, ship_path(conn, :create), ship: @invalid_attrs
    assert html_response(conn, 200) =~ "New ship"
  end

  test "shows chosen resource", %{conn: conn} do
    ship = Repo.insert! %Ship{}
    conn = get conn, ship_path(conn, :show, ship)
    assert html_response(conn, 200) =~ "Show ship"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, ship_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    ship = Repo.insert! %Ship{}
    conn = get conn, ship_path(conn, :edit, ship)
    assert html_response(conn, 200) =~ "Edit ship"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    ship = Repo.insert! %Ship{}
    conn = put conn, ship_path(conn, :update, ship), ship: @valid_attrs
    assert redirected_to(conn) == ship_path(conn, :show, ship)
    assert Repo.get_by(Ship, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    ship = Repo.insert! %Ship{}
    conn = put conn, ship_path(conn, :update, ship), ship: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit ship"
  end

  test "deletes chosen resource", %{conn: conn} do
    ship = Repo.insert! %Ship{}
    conn = delete conn, ship_path(conn, :delete, ship)
    assert redirected_to(conn) == ship_path(conn, :index)
    refute Repo.get(Ship, ship.id)
  end
end
