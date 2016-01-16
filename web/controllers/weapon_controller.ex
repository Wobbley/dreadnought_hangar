defmodule DreadnoughtHangar.WeaponController do
  use DreadnoughtHangar.Web, :controller

  alias DreadnoughtHangar.Weapon

  plug :scrub_params, "weapon" when action in [:create, :update]

  def index(conn, _params) do
    weapons = Repo.all(Weapon)
    render(conn, "index.html", weapons: weapons)
  end

  def new(conn, _params) do
    changeset = Weapon.changeset(%Weapon{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"weapon" => weapon_params}) do
    changeset = Weapon.changeset(%Weapon{}, weapon_params)

    case Repo.insert(changeset) do
      {:ok, _weapon} ->
        conn
        |> put_flash(:info, "Weapon created successfully.")
        |> redirect(to: weapon_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    weapon = Repo.get!(Weapon, id)
    render(conn, "show.html", weapon: weapon)
  end

  def edit(conn, %{"id" => id}) do
    weapon = Repo.get!(Weapon, id)
    changeset = Weapon.changeset(weapon)
    render(conn, "edit.html", weapon: weapon, changeset: changeset)
  end

  def update(conn, %{"id" => id, "weapon" => weapon_params}) do
    weapon = Repo.get!(Weapon, id)
    changeset = Weapon.changeset(weapon, weapon_params)

    case Repo.update(changeset) do
      {:ok, weapon} ->
        conn
        |> put_flash(:info, "Weapon updated successfully.")
        |> redirect(to: weapon_path(conn, :show, weapon))
      {:error, changeset} ->
        render(conn, "edit.html", weapon: weapon, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    weapon = Repo.get!(Weapon, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(weapon)

    conn
    |> put_flash(:info, "Weapon deleted successfully.")
    |> redirect(to: weapon_path(conn, :index))
  end
end
