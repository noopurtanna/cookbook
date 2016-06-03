defmodule Cookbook.Ingredient do
  use Cookbook.Web, :model

  schema "ingredients" do
    field :name, :string
    field :quantity, :float
    field :unit, :string
    belongs_to :recipe, Cookbook.Recipe, foreign_key: :recipe_id

    timestamps
  end

  @required_fields ~w(name quantity unit recipe_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
