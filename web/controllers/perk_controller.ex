defmodule DreadnoughtHangar.PerkController do
  use DreadnoughtHangar.Web, :controller

  alias DreadnoughtHangar.Perk

  plug :scrub_params, "perk" when action in [:create, :update]

  def index(conn, _params) do
    perks = Repo.all(Perk)
    render(conn, "index.html", perks: perks)
  end

  def new(conn, _params) do
    changeset = Perk.changeset(%Perk{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"perk" => perk_params}) do
    changeset = Perk.changeset(%Perk{}, perk_params)

    case Repo.insert(changeset) do
      {:ok, _perk} ->
        conn
        |> put_flash(:info, "Perk created successfully.")
        |> redirect(to: perk_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    perk = Repo.get!(Perk, id)
    render(conn, "show.html", perk: perk)
  end

  def edit(conn, %{"id" => id}) do
    perk = Repo.get!(Perk, id)
    changeset = Perk.changeset(perk)
    render(conn, "edit.html", perk: perk, changeset: changeset)
  end

  def update(conn, %{"id" => id, "perk" => perk_params}) do
    perk = Repo.get!(Perk, id)
    changeset = Perk.changeset(perk, perk_params)

    case Repo.update(changeset) do
      {:ok, perk} ->
        conn
        |> put_flash(:info, "Perk updated successfully.")
        |> redirect(to: perk_path(conn, :show, perk))
      {:error, changeset} ->
        render(conn, "edit.html", perk: perk, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    perk = Repo.get!(Perk, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(perk)

    conn
    |> put_flash(:info, "Perk deleted successfully.")
    |> redirect(to: perk_path(conn, :index))
  end
end
