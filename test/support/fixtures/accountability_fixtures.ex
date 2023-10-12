defmodule AccountabilityBuddy.AccountabilityFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AccountabilityBuddy.Accountability` context.
  """

  @doc """
  Generate a tasks.
  """
  def tasks_fixture(attrs \\ %{}) do
    {:ok, tasks} =
      attrs
      |> Enum.into(%{
        description: "some description",
        priority: 42,
        title: "some title"
      })
      |> AccountabilityBuddy.Accountability.create_tasks()

    tasks
  end
end
