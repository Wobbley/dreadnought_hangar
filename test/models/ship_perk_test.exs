defmodule DreadnoughtHangar.ShipPerkTest do
  use DreadnoughtHangar.ModelCase

  alias DreadnoughtHangar.ShipPerk

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ShipPerk.changeset(%ShipPerk{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ShipPerk.changeset(%ShipPerk{}, @invalid_attrs)
    refute changeset.valid?
  end
end
