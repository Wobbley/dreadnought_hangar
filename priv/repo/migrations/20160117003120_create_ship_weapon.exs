defmodule DreadnoughtHangar.Repo.Migrations.CreateShipWeapon do
  use Ecto.Migration

  def change do
    create table(:ships_weapons) do
      add :ship_id, references(:ships, on_delete: :nothing)
      add :weapon_id, references(:weapons, on_delete: :nothing)

      timestamps
    end
    create index(:ships_weapons, [:ship_id])
    create index(:ships_weapons, [:weapon_id])

  end
end
