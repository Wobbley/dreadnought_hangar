defmodule DreadnoughtData.Repo.Migrations.SearchIndices do
  @moduledoc """
  Creates search indices
  """
  use Ecto.Migration

  def up do
    execute "CREATE EXTENSION IF NOT EXISTS pg_trgm;"

    execute "CREATE INDEX ships_name_trgm_index ON ships USING gin (name gin_trgm_ops);"
    execute "CREATE INDEX weapons_name_trgm_index ON weapons USING gin (name gin_trgm_ops);"
    execute "CREATE INDEX abilities_name_trgm_index ON abilities USING gin (name gin_trgm_ops);"
    execute "CREATE INDEX perks_name_trgm_index ON perks USING gin (name gin_trgm_ops);"
  end

  def down do
    execute "DROP INDEX ships_name_trgm_index;"
    execute "DROP INDEX weapons_name_trgm_index;"
    execute "DROP INDEX abilities_name_trgm_index;"
    execute "DROP INDEX perks_name_trgm_index;"
  end
end