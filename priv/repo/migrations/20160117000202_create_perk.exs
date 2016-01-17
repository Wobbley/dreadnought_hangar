defmodule DreadnoughtHangar.Repo.Migrations.CreatePerk do
  use Ecto.Migration

  def change do
    create table(:perks) do
      add :name, :string
      add :type, :string
      add :icon_uri, :string

      timestamps
    end
    create unique_index(:perks, [:name])

  end
end
