defmodule DreadnoughtHangar.Weapon do
  use DreadnoughtHangar.Web, :model
  
  alias DreadnoughtHangar.{Ship, ShipWeapon}

  schema "weapons" do
      field :name, :string
      field :description, :string
      field :slot, :string
      field :usable_by, :string
      field :unlock_level, :integer
      field :cr, :integer
      field :sp, :integer
      field :shots, :integer
      field :reload_time, :integer
      field :icon_uri, :string
      field :raw_json, :map
    
    timestamps
    
    has_many :ships_weapons, ShipWeapon
    has_many :ships, through: [:ships_weapons, :weapons]
  end

  @required_fields ~w(name slot usable_by icon_uri)
  @optional_fields ~w(description unlock_level sp cr shots reload_time raw_json)

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
    inner_join: s in Ship, on: s.type == w.usable_by,
    select: s,
    where: w.name == ^weapon_name
  end
  
  @doc """
  Returns query which performs a search on weapon with the given search query.
  """
  def search(query, search_query) do
    from(w in query,
    where: fragment("? LIKE ('%'||?||'%')", w.name, ^search_query),
    order_by: fragment("similarity(?, ?) DESC", w.name, ^search_query))
  end
end
