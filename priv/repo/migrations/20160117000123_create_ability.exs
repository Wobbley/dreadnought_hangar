defmodule DreadnoughtHangar.Repo.Migrations.CreateAbility do
  use Ecto.Migration

  def change do
    create table(:abilities) do
      add :name, :citext
      add :description, :string
      add :slot, :citext
      add :usable_by, :citext
      add :unlock_level, :integer
      add :cr, :integer
      add :sp, :integer
      add :duration, :integer
      add :cooldown, :integer
      add :icon_uri, :string
      add :raw_json, :map

      timestamps
    end
    
    create unique_index(:abilities, [:name])

  end
end
