defmodule Cookbook.Recipe do
  use Cookbook.Web, :model

  schema "recipes" do
    field :title, :string
    field :description, :string
    field :cook_time, :integer
    field :category, :string

    has_many :ingredients, Cookbook.Ingredient
    has_many :instructions, Cookbook.Instruction

    timestamps
  end

  @required_fields ~w(title description cook_time category)
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
