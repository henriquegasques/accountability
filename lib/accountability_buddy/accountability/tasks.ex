defmodule AccountabilityBuddy.Accountability.Tasks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :priority, :integer
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tasks, attrs) do
    tasks
    |> cast(attrs, [:title, :description, :priority])
    |> validate_required([:title, :description, :priority])
  end
end
