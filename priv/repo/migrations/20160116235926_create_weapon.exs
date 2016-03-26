defmodule DreadnoughtHangar.Repo.Migrations.CreateWeapon do
  use Ecto.Migration

  def change do
    create table(:weapons) do
      add :name, :citext
      add :description, :string
      add :slot, :string
      add :usable_by, :string
      add :unlock_level, :integer
      add :sp, :integer
      add :cr, :integer
      add :shots, :integer
      add :reload_time, :integer
      add :icon_uri, :string
      add :raw_json, :map

      timestamps
    end
    
    create unique_index(:weapons, [:name])

  end
end