defmodule DreadnoughtHangar.Repo.Migrations.CreateAbility do
  use Ecto.Migration

  def change do
    create table(:abilities) do
      add :name, :string
      add :type, :string
      add :duration, :integer
      add :cooldown, :integer
      add :icon_uri, :string

      timestamps
    end
    create unique_index(:abilities, [:name])

  end
end
