defmodule DreadnoughtHangar.PerkView do
  use DreadnoughtHangar.Web, :view
  
  def render("perk_index.json", %{perks: perks}) do
    %{data: render_many(perks, DreadnoughtHangar.PerkView, "perk.json")}
  end

  def render("perk_show.json", %{perk: perk}) do
    %{data: render_one(perk, DreadnoughtHangar.PerkView, "perk.json")}
  end

  def render("perk.json", %{perk: perk}) do
    %{id: perk.id,
      name: perk.name,
      type: perk.type,
      icon_uri: perk.icon_uri}
  end
end
