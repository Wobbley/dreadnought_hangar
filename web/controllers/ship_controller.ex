defmodule DreadnoughtHangar.ShipController do
  use DreadnoughtHangar.Web, :controller

  alias DreadnoughtHangar.Ship

  plug :scrub_params, "ship" when action in [:create, :update]

  @doc """
  Return all ships as html.
  """
  def html_ship_index(conn, _params) do
    ships = Repo.all(Ship)
    render(conn, "ship_index.html", ships: ships)
  end
  
  @doc """
  Given a ship name return information about the ship. In addition
  to the weapons and abilities it can use as html.
  """
  def html_ship_info(conn, %{"ship_name" => ship_name}) do
    ship = Repo.get_by(Ship, name: ship_name)
    weapons = Ship |> Ship.get_weapons(ship_name) |> Repo.all
    abilities = Ship |> Ship.get_abilities(ship_name) |> Repo.all
    perks = Ship |> Ship.get_perks(ship_name) |> Repo.all
    render(conn, "ship_show.html", ship: ship, weapons: weapons, abilities: abilities, perks: perks)
  end
end