defmodule DreadnoughtHangar.WeaponView do
  use DreadnoughtHangar.Web, :view
  
  def render("weapon_index.json", %{weapons: weapons}) do
    %{data: render_many(weapons, DreadnoughtHangar.WeaponView, "weapon.json")}
  end

  def render("weapon_show.json", %{weapon: weapon}) do
    %{data: render_one(weapon, DreadnoughtHangar.WeaponView, "weapon.json")}
  end

  def render("weapon.json", %{weapon: weapon}) do
    %{id: weapon.id,
      name: weapon.name,
      type: weapon.type,
      shots: weapon.shots,
      reload_time: weapon.reload_time,
      icon_uri: weapon.icon_uri}
  end
end
