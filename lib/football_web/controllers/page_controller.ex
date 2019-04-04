defmodule FootballWeb.PageController do
  use FootballWeb, :controller
  alias Football.General

  require IEx

  def index(conn, _params) do
    teams = General.list_teams()
    team_stats = General.list_team_stats_score()

    render(conn, "index.html", teams: teams, team_stats: team_stats)
  end
end
