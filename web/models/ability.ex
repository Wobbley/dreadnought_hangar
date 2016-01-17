defmodule DreadnoughtHangar.Ability do
  use DreadnoughtHangar.Web, :model

  schema "abilities" do
    field :name, :string
    field :type, :string
    field :duration, :integer
    field :cooldown, :integer
    field :icon_uri, :string

    timestamps
    
    has_many :ships_abilities, DreadnoughtHangar.ShipAbility
    has_many :ships, through: [:ships_abilities, :abilities]
  end

  @required_fields ~w(name type duration cooldown icon_uri)
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
