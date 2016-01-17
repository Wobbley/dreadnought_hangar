defmodule DreadnoughtHangar.Repo.Migrations.Extensions do
  @moduledoc """
  Enables the citext extension in a PostgreSQL database.
  """
  use Ecto.Migration

  def up do
    execute "CREATE EXTENSION IF NOT EXISTS citext;"
  end
end