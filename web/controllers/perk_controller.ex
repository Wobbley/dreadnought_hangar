defmodule DreadnoughtHangar.PerkController do
  use DreadnoughtHangar.Web, :controller

  alias DreadnoughtHangar.{Perk}

  plug :scrub_params, "perk" when action in [:create, :update]
  
  @doc """
  Returns all perks as html.
  """
  def html_perk_index(conn, _params) do
    perks = Repo.all(Perk)
    render(conn, "perk_index.html", perks: perks)
  end

  @doc """
  Returns perk and list of ships that can use the perk as html, given a perk name.
  """
  def html_perk_info(conn, %{"perk_name" => perk_name}) do
    perk = Repo.get_by(Perk, name: perk_name)
    render(conn, "perk_show.html", perk: perk)
  end
  
  @doc """
  Returns all perks as json.
  """
  def json_perk_index(conn, _params) do
    perks = Repo.all(Perk)
    render(conn, "perk_index.json", perks: perks)
  end
  
  @doc """
  Returns perk as json given a perk name.
  """
  def json_perk_show(conn, %{"perk_name" => perk_name}) do
    perk = Repo.get_by(Perk, name: perk_name)
    render(conn, "perk_show.json", perk: perk)
  end
 
end
