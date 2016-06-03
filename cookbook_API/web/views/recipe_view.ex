defmodule Cookbook.RecipeView do
  use Cookbook.Web, :view

  def render("index.json", %{recipes: recipes}) do
    %{data: render_many(recipes, Cookbook.RecipeView, "recipe.json")}
  end

  def render("show.json", %{recipe: recipe}) do
    %{data: render_one(recipe, Cookbook.RecipeView, "recipe.json")}
  end

  def render("recipe.json", %{recipe: recipe}) do
    %{id: recipe.id,
      title: recipe.title,
      description: recipe.description,
      cook_time: recipe.cook_time,
      category: recipe.category}
  end
end
