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
    
    get "/ships", ShipController, :html_ship_index
    get "/ships/:ship_name", ShipController, :html_ship_info
    
    get "/abilities", AbilityController, :html_ability_index
    get "/abilities/:ability_name", AbilityController, :html_ability_info

    get "/weapons", WeaponController, :html_weapon_index
    get "/weapons/:weapon_name", WeaponController, :html_weapon_info
  
    resources "/perks", PerkController
  
  end

  # Other scopes may use custom stacks.
  # scope "/api", DreadnoughtHangar do
  #   pipe_through :api
  # end
end
