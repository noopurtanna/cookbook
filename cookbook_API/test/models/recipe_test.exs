defmodule Cookbook.RecipeTest do
  use Cookbook.ModelCase

  alias Cookbook.Recipe

  @valid_attrs %{category: "some content", cook_time: 42, description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Recipe.changeset(%Recipe{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Recipe.changeset(%Recipe{}, @invalid_attrs)
    refute changeset.valid?
  end
end
