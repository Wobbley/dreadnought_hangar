defmodule DreadnoughtHangar.Repo.Migrations.CreateWeapon do
  use Ecto.Migration

  def change do
    create table(:weapons) do
      add :name, :string
      add :type, :string
      add :shots, :integer
      add :reload_time, :integer
      add :icon_uri, :integer

      timestamps
    end
    create unique_index(:weapons, [:name])

  end
end
