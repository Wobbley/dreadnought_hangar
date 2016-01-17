defmodule DreadnoughtHangar.WeaponController do
  use DreadnoughtHangar.Web, :controller

  alias DreadnoughtHangar.Weapon

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
end
