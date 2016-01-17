defmodule DreadnoughtHangar.AbilityTest do
  use DreadnoughtHangar.ModelCase

  alias DreadnoughtHangar.Ability

  @valid_attrs %{cooldown: 42, duration: 42, icon_uri: "some content", name: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Ability.changeset(%Ability{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Ability.changeset(%Ability{}, @invalid_attrs)
    refute changeset.valid?
  end
end
