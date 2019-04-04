defmodule Football.General.Team_Stats do
  use Ecto.Schema
  import Ecto.Changeset

  schema "team_stats" do
    field :games_draw, :integer
    field :games_lost, :integer
    field :games_played, :integer
    field :games_won, :integer
    field :goal_difference, :integer
    field :points, :integer
    field :team_id, :integer

    timestamps()
  end

  @doc false
  def changeset(team__stats, attrs) do
    team__stats
    |> cast(attrs, [:team_id, :games_played, :games_won, :games_draw, :games_lost, :goal_difference, :points])
    |> validate_required([:team_id, :games_played, :games_won, :games_draw, :games_lost, :goal_difference, :points])
  end
end
