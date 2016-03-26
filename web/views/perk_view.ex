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
      description: perk.description,
      slot: perk.slot,
      type: perk.type,
      unlock_level: perk.unlock_level,
      cr: perk.cr,
      sr: perk.sr,
      trigger: perk.trigger,
      effect: perk.effect,
      icon_uri: perk.icon_uri}
  end
end
