defmodule DreadnoughtHangar.Perk do
  use DreadnoughtHangar.Web, :model

  schema "perks" do
    field :name, :string
    field :type, :string
    field :icon_uri, :string

    timestamps
    
    has_many :ships_perks, DreadnoughtHangar.ShipPerk
    has_many :ships, through: [:ships_perks, :perks]
  end

  @required_fields ~w(name type icon_uri)
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
  Returns the query to find all ships that can use a perk, given a perk name.
  """
  def get_ships(query, perk_name) do
    from p in query,
    join: sp in ShipPerk, on: p.id == sp.perk_id,
    inner_join: s in Ship, on: s.id == sp.ship_id,
    select: s,
    where: p.name == ^perk_name
  end
end
