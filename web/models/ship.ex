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
  
  @doc """
  Returns the query to find all abilities a ship can use, given it's name.
  """
  def get_abilities(query, ship_name) do
    from s in query,
    join: sa in DreadnoughtHangar.ShipAbility, on: s.id == sa.ship_id,
    inner_join: a in DreadnoughtHangar.Ability, on: a.id == sa.ability_id,
    select: a,
    where: s.name == ^ship_name
  end
  
  @doc """
  Returns the query to find all weapons a ship can use, given it's name.
  """
  def get_weapons(query, ship_name) do
    from s in query,
    join: sw in DreadnoughtHangar.ShipWeapon, on: s.id == sw.ship_id,
    inner_join: w in DreadnoughtHangar.Weapon, on: w.id == sw.weapon_id,
    select: w,
    where: s.name == ^ship_name
  end
  
  @doc """
  Returns the query to find all weapons a ship can use, given it's name.
  """
  def get_perks(query, ship_name) do
    from s in query,
    join: sp in DreadnoughtHangar.ShipPerk, on: s.id == sp.ship_id,
    inner_join: p in DreadnoughtHangar.Perk, on: p.id == sp.perk_id,
    select: p,
    where: s.name == ^ship_name
  end
end
