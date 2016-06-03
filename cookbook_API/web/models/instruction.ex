defmodule Cookbook.Instruction do
  use Cookbook.Web, :model

  schema "instructions" do
    field :body, :string
    belongs_to :recipe, Cookbook.Recipe, foreign_key: :recipe_id

    timestamps
  end

  @required_fields ~w(body recipe_id)
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
