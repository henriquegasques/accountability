defmodule AccountabilityBuddy.AccountabilityTest do
  use AccountabilityBuddy.DataCase

  alias AccountabilityBuddy.Accountability

  describe "tasks" do
    alias AccountabilityBuddy.Accountability.Tasks

    import AccountabilityBuddy.AccountabilityFixtures

    @invalid_attrs %{description: nil, priority: nil, title: nil}

    test "list_tasks/0 returns all tasks" do
      tasks = tasks_fixture()
      assert Accountability.list_tasks() == [tasks]
    end

    test "get_tasks!/1 returns the tasks with given id" do
      tasks = tasks_fixture()
      assert Accountability.get_tasks!(tasks.id) == tasks
    end

    test "create_tasks/1 with valid data creates a tasks" do
      valid_attrs = %{description: "some description", priority: 42, title: "some title"}

      assert {:ok, %Tasks{} = tasks} = Accountability.create_tasks(valid_attrs)
      assert tasks.description == "some description"
      assert tasks.priority == 42
      assert tasks.title == "some title"
    end

    test "create_tasks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accountability.create_tasks(@invalid_attrs)
    end

    test "update_tasks/2 with valid data updates the tasks" do
      tasks = tasks_fixture()

      update_attrs = %{
        description: "some updated description",
        priority: 43,
        title: "some updated title"
      }

      assert {:ok, %Tasks{} = tasks} = Accountability.update_tasks(tasks, update_attrs)
      assert tasks.description == "some updated description"
      assert tasks.priority == 43
      assert tasks.title == "some updated title"
    end

    test "update_tasks/2 with invalid data returns error changeset" do
      tasks = tasks_fixture()
      assert {:error, %Ecto.Changeset{}} = Accountability.update_tasks(tasks, @invalid_attrs)
      assert tasks == Accountability.get_tasks!(tasks.id)
    end

    test "delete_tasks/1 deletes the tasks" do
      tasks = tasks_fixture()
      assert {:ok, %Tasks{}} = Accountability.delete_tasks(tasks)
      assert_raise Ecto.NoResultsError, fn -> Accountability.get_tasks!(tasks.id) end
    end

    test "change_tasks/1 returns a tasks changeset" do
      tasks = tasks_fixture()
      assert %Ecto.Changeset{} = Accountability.change_tasks(tasks)
    end
  end
end
