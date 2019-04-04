defmodule Football.Repo.Migrations.CreateTeamStats do
  use Ecto.Migration

  def change do
    create table(:team_stats) do
      add :team_id, :integer
      add :games_played, :integer
      add :games_won, :integer
      add :games_draw, :integer
      add :games_lost, :integer
      add :goal_difference, :integer
      add :points, :integer

      timestamps()
    end

  end
end
