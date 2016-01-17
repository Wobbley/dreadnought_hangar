defmodule DreadnoughtHangar.AbilityControllerTest do
  use DreadnoughtHangar.ConnCase

  alias DreadnoughtHangar.Ability
  @valid_attrs %{cooldown: 42, duration: 42, icon_uri: "some content", name: "some content", type: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, ability_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing abilities"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, ability_path(conn, :new)
    assert html_response(conn, 200) =~ "New ability"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, ability_path(conn, :create), ability: @valid_attrs
    assert redirected_to(conn) == ability_path(conn, :index)
    assert Repo.get_by(Ability, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, ability_path(conn, :create), ability: @invalid_attrs
    assert html_response(conn, 200) =~ "New ability"
  end

  test "shows chosen resource", %{conn: conn} do
    ability = Repo.insert! %Ability{}
    conn = get conn, ability_path(conn, :show, ability)
    assert html_response(conn, 200) =~ "Show ability"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, ability_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    ability = Repo.insert! %Ability{}
    conn = get conn, ability_path(conn, :edit, ability)
    assert html_response(conn, 200) =~ "Edit ability"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    ability = Repo.insert! %Ability{}
    conn = put conn, ability_path(conn, :update, ability), ability: @valid_attrs
    assert redirected_to(conn) == ability_path(conn, :show, ability)
    assert Repo.get_by(Ability, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    ability = Repo.insert! %Ability{}
    conn = put conn, ability_path(conn, :update, ability), ability: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit ability"
  end

  test "deletes chosen resource", %{conn: conn} do
    ability = Repo.insert! %Ability{}
    conn = delete conn, ability_path(conn, :delete, ability)
    assert redirected_to(conn) == ability_path(conn, :index)
    refute Repo.get(Ability, ability.id)
  end
end
