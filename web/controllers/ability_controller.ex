defmodule DreadnoughtHangar.AbilityController do
  use DreadnoughtHangar.Web, :controller

  alias DreadnoughtHangar.Ability

  plug :scrub_params, "ability" when action in [:create, :update]

  def index(conn, _params) do
    abilities = Repo.all(Ability)
    render(conn, "index.html", abilities: abilities)
  end

  def new(conn, _params) do
    changeset = Ability.changeset(%Ability{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ability" => ability_params}) do
    changeset = Ability.changeset(%Ability{}, ability_params)

    case Repo.insert(changeset) do
      {:ok, _ability} ->
        conn
        |> put_flash(:info, "Ability created successfully.")
        |> redirect(to: ability_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ability = Repo.get!(Ability, id)
    render(conn, "show.html", ability: ability)
  end

  def edit(conn, %{"id" => id}) do
    ability = Repo.get!(Ability, id)
    changeset = Ability.changeset(ability)
    render(conn, "edit.html", ability: ability, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ability" => ability_params}) do
    ability = Repo.get!(Ability, id)
    changeset = Ability.changeset(ability, ability_params)

    case Repo.update(changeset) do
      {:ok, ability} ->
        conn
        |> put_flash(:info, "Ability updated successfully.")
        |> redirect(to: ability_path(conn, :show, ability))
      {:error, changeset} ->
        render(conn, "edit.html", ability: ability, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ability = Repo.get!(Ability, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(ability)

    conn
    |> put_flash(:info, "Ability deleted successfully.")
    |> redirect(to: ability_path(conn, :index))
  end
end
