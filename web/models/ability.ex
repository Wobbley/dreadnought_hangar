defmodule DreadnoughtHangar.Ability do
  use DreadnoughtHangar.Web, :model
  
  alias DreadnoughtHangar.{Ship, ShipAbility}

  schema "abilities" do
      field :name, :string
      field :description, :string
      field :slot, :string
      field :usable_by, :string
      field :unlock_level, :integer
      field :cr, :integer
      field :sp, :integer
      field :duration, :integer
      field :cooldown, :integer
      field :icon_uri, :string
      field :raw_json, :map

    timestamps
    
    has_many :ships_abilities, ShipAbility
    has_many :ships, through: [:ships_abilities, :abilities]
  end

  @required_fields ~w(name slot usable_by icon_uri)
  @optional_fields ~w(description unlock_level cr sr duration cooldown raw_json)

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
  Returns the query to find all ships that can use an ability, given an ability name.
  """
  def get_ships(query, ability_name) do
    from a in query,
    inner_join: s in Ship, on: s.type == a.usable_by,
    select: s,
    where: a.name == ^ability_name
  end
  
  @doc """
  Performs a search on ability names with the given search query.
  """
  def search(query, search_query) do
    from(a in query,
    where: fragment("? LIKE ('%'||?||'%')", a.name, ^search_query),
    order_by: fragment("similarity(?, ?) DESC", a.name, ^search_query))
  end
end
