defmodule Cookbook.Repo.Migrations.CreateIngredient do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :name, :string
      add :quantity, :float
      add :unit, :string
      add :recipe_id, references(:recipes, on_delete: :nothing)

      timestamps
    end
    create index(:ingredients, [:recipe_id])

  end
end
