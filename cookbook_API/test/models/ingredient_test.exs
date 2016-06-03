defmodule Cookbook.IngredientTest do
  use Cookbook.ModelCase

  alias Cookbook.Ingredient

  @valid_attrs %{name: "some content", quantity: "120.5", unit: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Ingredient.changeset(%Ingredient{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Ingredient.changeset(%Ingredient{}, @invalid_attrs)
    refute changeset.valid?
  end
end
