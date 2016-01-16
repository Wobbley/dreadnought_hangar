defmodule DreadnoughtHangar.ShipTest do
  use DreadnoughtHangar.ModelCase

  alias DreadnoughtHangar.Ship

  @valid_attrs %{armor: 42, class: "some content", icon_uri: "some content", name: "some content", subclass: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Ship.changeset(%Ship{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Ship.changeset(%Ship{}, @invalid_attrs)
    refute changeset.valid?
  end
end
