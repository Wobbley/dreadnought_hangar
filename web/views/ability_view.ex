defmodule DreadnoughtHangar.AbilityView do
  use DreadnoughtHangar.Web, :view
  
  def render("ability_index.json", %{abilities: abilities}) do
    %{data: render_many(abilities, DreadnoughtHangar.AbilityView, "ability.json")}
  end

  def render("ability_show.json", %{ability: ability}) do
    %{data: render_one(ability, DreadnoughtHangar.AbilityView, "ability.json")}
  end

  def render("ability.json", %{ability: ability}) do
    %{id: ability.id,
      name: ability.name,
      type: ability.type,
      duration: ability.duration,
      cooldown: ability.cooldown,
      icon_uri: ability.icon_uri}
  end
end
