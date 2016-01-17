defmodule DreadnoughtHangar.ShipAbilityTest do
  use DreadnoughtHangar.ModelCase

  alias DreadnoughtHangar.ShipAbility

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ShipAbility.changeset(%ShipAbility{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ShipAbility.changeset(%ShipAbility{}, @invalid_attrs)
    refute changeset.valid?
  end
end
