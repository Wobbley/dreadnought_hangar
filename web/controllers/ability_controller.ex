defmodule DreadnoughtHangar.AbilityController do
  use DreadnoughtHangar.Web, :controller

  alias DreadnoughtHangar.{Ability, Ship}

  plug :scrub_params, "ability" when action in [:create, :update]

  @doc """
  Returns all abilities as html
  """
  def html_ability_index(conn, _params) do
    abilities = Repo.all(Ability)
    render(conn, "ability_index.html", abilities: abilities)
  end
  
  @doc """
  Takes an ability name.
  Returns information about a specific ability, and a list
  of ships that can use the ability as html.
  """
  def html_ability_info(conn, %{"ability_name" => ability_name}) do
    ability = Repo.get_by(Ability, name: ability_name)
    ships = Ability |> Ability.get_ships(ability_name) |> Repo.all
    render(conn, "ability_show.html", ability: ability, ships: ships)
  end
end
