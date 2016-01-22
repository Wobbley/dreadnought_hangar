defmodule DreadnoughtHangar.WeaponController do
  use DreadnoughtHangar.Web, :controller

  alias DreadnoughtHangar.{Ship, Weapon}

  plug :scrub_params, "weapon" when action in [:create, :update]

  @doc """
  Returns all weapons as html.
  """
  def html_weapon_index(conn, _params) do
    weapons = Repo.all(Weapon)
    render(conn, "weapon_index.html", weapons: weapons)
  end

  @doc """
  Given a weapon name, return info about the weapon and the ships that can use it
  as html.
  """
  def html_weapon_info(conn, %{"weapon_name" => weapon_name}) do
    weapon = Repo.get_by(Weapon, name: weapon_name)
    ships = Weapon |> Weapon.get_ships(weapon_name) |> Repo.all
    render(conn, "weapon_show.html", weapon: weapon, ships: ships)
  end
  
  @doc """
  Return all weapons as json.
  """
  def json_weapon_index(conn, _params) do
    weapons = Repo.all(Weapon)
    render(conn, "weapon_index.json", weapons: weapons)
  end
  
  @doc """
  Given a weapon name, return weapon information as json.
  """
  def json_weapon_show(conn, %{"weapon_name" => weapon_name}) do
    weapon = Repo.get_by(Weapon, name: weapon_name)
    render(conn, "weapon_show.json", weapon: weapon)
  end
  
  @doc """
  Given a ship name, return all weapons the ship can use.
  """
  def json_weapons_by_ship(conn, %{"ship_name" => ship_name}) do
    weapons = Ship |> Ship.get_weapons(ship_name) |> Repo.all
    render(conn, "weapon_index.json", weapons: weapons)
  end
end
