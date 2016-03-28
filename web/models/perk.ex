defmodule DreadnoughtHangar.Perk do
  use DreadnoughtHangar.Web, :model

  alias DreadnoughtHangar.{Ship, ShipPerk}
  
  schema "perks" do
      field :name, :string
      field :description, :string
      field :slot, :string
      field :type, :string
      field :unlock_level, :integer
      field :cr, :integer
      field :sr, :integer
      field :trigger, :string
      field :effect, :string
      field :icon_uri, :string
      field :raw_json, :map

    timestamps
    
    has_many :ships_perks, DreadnoughtHangar.ShipPerk
    has_many :ships, through: [:ships_perks, :perks]
  end

  @required_fields ~w(name slot type icon_uri)
  @optional_fields ~w(description unlock_level cr sr raw_json trigger effect)

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
  Query to perform a search on perk names with the given search query.
  """
  def search(query, search_query) do
    from(p in query,
    where: fragment("? LIKE ('%'||?||'%')", p.name, ^search_query),
    order_by: fragment("similarity(?, ?) DESC", p.name, ^search_query))
  end
end
