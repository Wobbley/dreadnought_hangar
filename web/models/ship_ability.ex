defmodule DreadnoughtHangar.ShipAbility do
  use DreadnoughtHangar.Web, :model

  schema "ships_abilities" do
    belongs_to :ship, DreadnoughtHangar.Ship
    belongs_to :ability, DreadnoughtHangar.Ability

    timestamps
  end

  @required_fields ~w()
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
