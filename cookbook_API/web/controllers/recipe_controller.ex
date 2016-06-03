defmodule Cookbook.RecipeController do
  use Cookbook.Web, :controller

  alias Cookbook.Recipe

  plug :scrub_params, "recipe" when action in [:create, :update]

  def index(conn, _params) do
    recipes = Repo.all(Recipe)
    render(conn, "index.json", recipes: recipes)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    changeset = Recipe.changeset(%Recipe{}, recipe_params)

    case Repo.insert(changeset) do
      {:ok, recipe} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", recipe_path(conn, :show, recipe))
        |> render("show.json", recipe: recipe)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Cookbook.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe = Repo.get!(Recipe, id)
    render(conn, "show.json", recipe: recipe)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Repo.get!(Recipe, id)
    changeset = Recipe.changeset(recipe, recipe_params)

    case Repo.update(changeset) do
      {:ok, recipe} ->
        render(conn, "show.json", recipe: recipe)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Cookbook.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe = Repo.get!(Recipe, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(recipe)

    send_resp(conn, :no_content, "")
  end
end
