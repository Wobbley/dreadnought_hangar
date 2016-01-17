defmodule DreadnoughtHangar.Router do
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

  scope "/", DreadnoughtHangar do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    
    get "/ships", ShipController, :html_ship_index
    get "/ships/:ship_name", ShipController, :html_ship_info
    
    get "/abilities", AbilityController, :html_ability_index
    get "/abilities/:ability_name", AbilityController, :html_ability_info

    
    resources "/perks", PerkController
    
    resources "/abilities", AbilityController
    
    resources "/weapons", WeaponController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DreadnoughtHangar do
  #   pipe_through :api
  # end
end
