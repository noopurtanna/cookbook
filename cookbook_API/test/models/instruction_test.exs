defmodule Cookbook.InstructionTest do
  use Cookbook.ModelCase

  alias Cookbook.Instruction

  @valid_attrs %{body: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Instruction.changeset(%Instruction{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Instruction.changeset(%Instruction{}, @invalid_attrs)
    refute changeset.valid?
  end
end
