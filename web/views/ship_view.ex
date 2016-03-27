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
      description: ship.description,
      type: ship.type,
      class: ship.class,
      unlock_level: ship.unlock_level,
      cr: ship.cr,
      sp: ship.sp,
      shield: ship.shield,
      armor: ship.armor,
      icon_uri: ship.icon_uri}
  end
end
