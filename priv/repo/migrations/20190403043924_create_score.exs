defmodule Football.Repo.Migrations.CreateScore do
  use Ecto.Migration

  def change do
    create table(:score) do
      add :team1_score, :integer
      add :team2_score, :integer
      add :team1_name, :string
      add :team2_name, :string

      timestamps()
    end

  end
end
