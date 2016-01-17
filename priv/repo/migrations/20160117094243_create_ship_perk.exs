defmodule DreadnoughtHangar.Repo.Migrations.CreateShipPerk do
  use Ecto.Migration

  def change do
    create table(:ships_perks) do
      add :ship_id, references(:ships, on_delete: :nothing)
      add :perk_id, references(:perks, on_delete: :nothing)

      timestamps
    end
    create index(:ships_perks, [:ship_id])
    create index(:ships_perks, [:perk_id])

  end
end
