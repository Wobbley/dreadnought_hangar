defmodule DreadnoughtHangar.Router do
  @moduledoc """
  Decides the routing in the application, specifying which uri calls the specific methods
  in the controllers.
  """
  use DreadnoughtHangar.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  #URIs for interaction with the html.
  scope "/", DreadnoughtHangar do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/loadout", PageController, :loadout
    
    get "/ships", ShipController, :html_ship_index
    get "/ships/:ship_name", ShipController, :html_ship_show
    
    get "/abilities", AbilityController, :html_ability_index
    get "/abilities/:ability_name", AbilityController, :html_ability_info

    get "/weapons", WeaponController, :html_weapon_index
    get "/weapons/:weapon_name", WeaponController, :html_weapon_info
  
    get "/perks", PerkController, :html_perk_index
    get "/perks/:perk_name", PerkController, :html_perk_info
    
    post "/search", SearchController, :search
  
  end

  #URIs for interaction with the json api.
  scope "/api", DreadnoughtHangar do
    pipe_through :api #Use the default api stack
    
    get "/ships", ShipController, :json_ship_index
    get "/ships/:ship_name", ShipController, :json_ship_show
    get "/ships/weapons/:ship_name", WeaponController, :json_weapons_by_ship
    get "/ships/abilities/:ship_name", AbilityController, :json_abilities_by_ship
    get "/ships/perks/:ship_name", PerkController, :json_perks_by_ship
      
  end
end
