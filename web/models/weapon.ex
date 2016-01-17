defmodule DreadnoughtHangar.Weapon do
  use DreadnoughtHangar.Web, :model
  
  alias DreadnoughtHangar.{Ship, ShipWeapon}

  schema "weapons" do
    field :name, :string
    field :type, :string
    field :shots, :integer
    field :reload_time, :integer
    field :icon_uri, :string

    timestamps
    
    has_many :ships_weapons, ShipWeapon
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
  
  @doc """
  Returns a query to retrieve ships that can use a weapon, given its name.
  """
  def get_ships(query, weapon_name) do
    from w in query,
    join: sw in ShipWeapon, on: w.id == sw.weapon_id,
    inner_join: s in Ship, on: s.id == sw.ship_id,
    select: s,
    where: w.name == ^weapon_name
  end
end
