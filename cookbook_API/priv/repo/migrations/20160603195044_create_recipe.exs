defmodule Cookbook.Repo.Migrations.CreateRecipe do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :description, :text
      add :cook_time, :integer
      add :category, :string

      timestamps
    end

  end
end
