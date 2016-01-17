defmodule DreadnoughtHangar.Ship do
  use DreadnoughtHangar.Web, :model

  schema "ships" do
    field :name, :string
    field :armor, :integer
    field :class, :string
    field :subclass, :string
    field :icon_uri, :string

    timestamps
    
    has_many :ships_weapons, DreadnoughtHangar.ShipWeapon
    has_many :weapons, through: [:ships_weapons, :ships]

    has_many :ships_abilities, DreadnoughtHangar.ShipAbility
    has_many :abilities, through: [:ships_abilities, :ships]
    
    has_many :ships_perks, DreadnoughtHangar.ShipPerk
    has_many :perks, through: [:ships_perks, :ships]
  end

  @required_fields ~w(name armor class subclass icon_uri)
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
