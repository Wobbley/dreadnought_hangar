defmodule DreadnoughtHangar.PageController do
  use DreadnoughtHangar.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  
  def loadout(conn, _params) do
    render conn, "loadout.html"
  end
end
