defmodule DreadnoughtHangar.Repo.Migrations.CreateShip do
  use Ecto.Migration

  def change do
    create table(:ships) do
      add :name, :citext
      add :description, :string
      add :type, :citext
      add :class, :citext
      add :unlock_level, :integer
      add :cr, :integer
      add :sp, :integer
      add :shield, :string
      add :armor, :integer
      add :icon_uri, :string
      add :raw_json, :map
      
      timestamps
    end
    
    create unique_index(:ships, [:name])

  end
end