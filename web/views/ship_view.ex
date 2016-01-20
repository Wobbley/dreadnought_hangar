defmodule DreadnoughtHangar.ShipView do
  use DreadnoughtHangar.Web, :view
  
  def render("ship_index.json", %{ships: ships}) do
    %{data: render_many(ships, DreadnoughtHangar.ShipView, "ship.json")}
  end
  
  def render("ship_show.json", %{ship: ship}) do
    %{data: render_one(ship, DreadnoughtHangar.ShipView, "ship.json")}
  end
  
  def render("ship.json", %{ship: ship}) do
    %{id: ship.id,
      name: ship.name,
      armor: ship.armor,
      class: ship.class,
      subclass: ship.subclass,
      icon_uri: ship.icon_uri}
  end
end
