defmodule DreadnoughtHangar.WeaponTest do
  use DreadnoughtHangar.ModelCase

  alias DreadnoughtHangar.Weapon

  @valid_attrs %{icon_uri: 42, name: "some content", reload_time: 42, shots: 42, type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Weapon.changeset(%Weapon{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Weapon.changeset(%Weapon{}, @invalid_attrs)
    refute changeset.valid?
  end
end
