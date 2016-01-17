defmodule DreadnoughtHangar.Repo.Migrations.CreateShipAbility do
  use Ecto.Migration

  def change do
    create table(:ships_abilities) do
      add :ship_id, references(:ships, on_delete: :nothing)
      add :ability_id, references(:abilities, on_delete: :nothing)

      timestamps
    end
    create index(:ships_abilities, [:ship_id])
    create index(:ships_abilities, [:ability_id])

  end
end
