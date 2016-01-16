defmodule DreadnoughtHangar.Repo.Migrations.CreateShip do
  use Ecto.Migration

  def change do
    create table(:ships) do
      add :name, :string
      add :armor, :integer
      add :class, :string
      add :subclass, :string
      add :icon_uri, :string

      timestamps
    end
    create unique_index(:ships, [:name])

  end
end
