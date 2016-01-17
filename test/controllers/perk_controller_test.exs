defmodule DreadnoughtHangar.PerkControllerTest do
  use DreadnoughtHangar.ConnCase

  alias DreadnoughtHangar.Perk
  @valid_attrs %{icon_uri: "some content", name: "some content", type: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, perk_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing perks"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, perk_path(conn, :new)
    assert html_response(conn, 200) =~ "New perk"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, perk_path(conn, :create), perk: @valid_attrs
    assert redirected_to(conn) == perk_path(conn, :index)
    assert Repo.get_by(Perk, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, perk_path(conn, :create), perk: @invalid_attrs
    assert html_response(conn, 200) =~ "New perk"
  end

  test "shows chosen resource", %{conn: conn} do
    perk = Repo.insert! %Perk{}
    conn = get conn, perk_path(conn, :show, perk)
    assert html_response(conn, 200) =~ "Show perk"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, perk_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    perk = Repo.insert! %Perk{}
    conn = get conn, perk_path(conn, :edit, perk)
    assert html_response(conn, 200) =~ "Edit perk"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    perk = Repo.insert! %Perk{}
    conn = put conn, perk_path(conn, :update, perk), perk: @valid_attrs
    assert redirected_to(conn) == perk_path(conn, :show, perk)
    assert Repo.get_by(Perk, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    perk = Repo.insert! %Perk{}
    conn = put conn, perk_path(conn, :update, perk), perk: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit perk"
  end

  test "deletes chosen resource", %{conn: conn} do
    perk = Repo.insert! %Perk{}
    conn = delete conn, perk_path(conn, :delete, perk)
    assert redirected_to(conn) == perk_path(conn, :index)
    refute Repo.get(Perk, perk.id)
  end
end
