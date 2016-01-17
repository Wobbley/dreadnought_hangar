defmodule DreadnoughtHangar.Weapon do
  use DreadnoughtHangar.Web, :model

  schema "weapons" do
    field :name, :string
    field :type, :string
    field :shots, :integer
    field :reload_time, :integer
    field :icon_uri, :integer

    timestamps
    
    has_many :ships_weapons, DreadnoughtHangar.ShipWeapon
    has_many :ships, through: [:ships_weapons, :weapons]
  end

  @required_fields ~w(name type shots reload_time icon_uri)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:name)
  end
end
