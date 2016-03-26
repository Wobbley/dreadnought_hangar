defmodule DreadnoughtHangar.Repo.Migrations.CreatePerk do
  use Ecto.Migration

  def change do
    create table(:perks) do
      add :name, :citext
      add :description, :string
      add :slot, :string
      add :type, :string
      add :unlock_level, :integer
      add :cr, :integer
      add :sr, :integer
      add :trigger, :string
      add :effect, :string
      add :icon_uri, :string
      add :raw_json, :map
      
      timestamps
    end
    
    create unique_index(:perks, [:name])

  end
end
