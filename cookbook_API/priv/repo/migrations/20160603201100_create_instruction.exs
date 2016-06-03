defmodule Cookbook.Repo.Migrations.CreateInstruction do
  use Ecto.Migration

  def change do
    create table(:instructions) do
      add :body, :text
      add :recipe_id, references(:recipes, on_delete: :nothing)

      timestamps
    end
    create index(:instructions, [:recipe_id])

  end
end
