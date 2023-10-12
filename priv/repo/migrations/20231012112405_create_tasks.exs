defmodule AccountabilityBuddy.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :description, :text
      add :priority, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
