defmodule DreadnoughtHangar.PerkTest do
  use DreadnoughtHangar.ModelCase

  alias DreadnoughtHangar.Perk

  @valid_attrs %{icon_uri: "some content", name: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Perk.changeset(%Perk{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Perk.changeset(%Perk{}, @invalid_attrs)
    refute changeset.valid?
  end
end
