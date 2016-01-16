defmodule DreadnoughtHangar.WeaponControllerTest do
  use DreadnoughtHangar.ConnCase

  alias DreadnoughtHangar.Weapon
  @valid_attrs %{icon_uri: 42, name: "some content", reload_time: 42, shots: 42, type: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, weapon_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing weapons"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, weapon_path(conn, :new)
    assert html_response(conn, 200) =~ "New weapon"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, weapon_path(conn, :create), weapon: @valid_attrs
    assert redirected_to(conn) == weapon_path(conn, :index)
    assert Repo.get_by(Weapon, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, weapon_path(conn, :create), weapon: @invalid_attrs
    assert html_response(conn, 200) =~ "New weapon"
  end

  test "shows chosen resource", %{conn: conn} do
    weapon = Repo.insert! %Weapon{}
    conn = get conn, weapon_path(conn, :show, weapon)
    assert html_response(conn, 200) =~ "Show weapon"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, weapon_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    weapon = Repo.insert! %Weapon{}
    conn = get conn, weapon_path(conn, :edit, weapon)
    assert html_response(conn, 200) =~ "Edit weapon"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    weapon = Repo.insert! %Weapon{}
    conn = put conn, weapon_path(conn, :update, weapon), weapon: @valid_attrs
    assert redirected_to(conn) == weapon_path(conn, :show, weapon)
    assert Repo.get_by(Weapon, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    weapon = Repo.insert! %Weapon{}
    conn = put conn, weapon_path(conn, :update, weapon), weapon: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit weapon"
  end

  test "deletes chosen resource", %{conn: conn} do
    weapon = Repo.insert! %Weapon{}
    conn = delete conn, weapon_path(conn, :delete, weapon)
    assert redirected_to(conn) == weapon_path(conn, :index)
    refute Repo.get(Weapon, weapon.id)
  end
end
