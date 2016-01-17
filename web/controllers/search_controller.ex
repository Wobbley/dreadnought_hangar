defmodule DreadnoughtHangar.SearchController do
  @moduledoc """
  Handles search requests from the web page
  """
  use DreadnoughtHangar.Web, :controller

  alias DreadnoughtHangar.{Ship, Weapon, Ability, Perk}

  plug :scrub_params, "search" when action in [:create, :update]

  @doc """
  Performs a search on ship, weapons, and abilities based on their name.
  """
  def search(conn, %{"search" => %{"query" => query}}) do
    ships = Ship |> Ship.search(query) |> Repo.all
    weapons = Weapon |> Weapon.search(query) |> Repo.all
    abilities = Ability |> Ability.search(query) |> Repo.all
    perks = Perk |> Perk.search(query) |> Repo.all
    render(conn, "search_results.html", ships: ships, weapons: weapons, abilities: abilities)
  end
end
