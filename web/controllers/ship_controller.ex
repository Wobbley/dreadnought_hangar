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
  def html_ship_show(conn, %{"ship_name" => ship_name}) do
    ship = Repo.get_by(Ship, name: ship_name)
    weapons = Ship |> Ship.get_weapons(ship_name) |> Repo.all
    abilities = Ship |> Ship.get_abilities(ship_name) |> Repo.all
    perks = Ship |> Ship.get_perks(ship_name) |> Repo.all
    render(conn, "ship_show.html", ship: ship, weapons: weapons, abilities: abilities, perks: perks)
  end
  
  @doc """
  Returns all ships as json.
  """
  def json_ship_index(conn, _params) do
    ships = Repo.all(Ship)
    render(conn, "ship_index.json", ships: ships)
  end
  
  @doc """
  Given a ship name, returns the ship as json.
  """
  def json_ship_show(conn, %{"ship_name" => ship_name}) do
    ship = Repo.get_by(Ship, name: ship_name)
    render(conn, "ship_show.json", ship: ship)
  end
  
  @doc """
  Given a weapon name, return all ships that can use the weapon.
  """
  def json_ships_by_weapon(conn, %{"weapon_name" => weapon_name}) do
    ships = Weapon |> Weapon.get_ships(weapon_name) |> Repo.all
    render(conn, "ship_index.json", ships: ships)
  end
  
  @doc """
  Given an ability name, return all ships that can use that ability.
  """
  def json_ships_by_ability(conn, %{"ability_name" => ability_name}) do
    ships = Ability |> Ability.get_ships(ability_name) |> Repo.all
    render(conn, "show_index.json", ships: ships)
  end
  
  @doc """
  Given an perk name, return all ships that can use that ability.
  """
  def json_ships_by_perk(conn, %{"perk_name" => perk_name}) do
    ships = Perk |> Perk.get_ships(perk_name) |> Repo.all
    render(conn, "index.json", ships: ships)
  end
end