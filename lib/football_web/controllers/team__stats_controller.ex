defmodule FootballWeb.Team_StatsController do
  use FootballWeb, :controller

  alias Football.General
  alias Football.General.Team_Stats

  def index(conn, _params) do
    team_stats = General.list_team_stats()
    render(conn, "index.html", team_stats: team_stats)
  end

  def new(conn, _params) do
    changeset = General.change_team__stats(%Team_Stats{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"team__stats" => team__stats_params}) do
    case General.create_team__stats(team__stats_params) do
      {:ok, team__stats} ->
        conn
        |> put_flash(:info, "Team  stats created successfully.")
        |> redirect(to: Routes.team__stats_path(conn, :show, team__stats))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    team__stats = General.get_team__stats!(id)
    render(conn, "show.html", team__stats: team__stats)
  end

  def edit(conn, %{"id" => id}) do
    team__stats = General.get_team__stats!(id)
    changeset = General.change_team__stats(team__stats)
    render(conn, "edit.html", team__stats: team__stats, changeset: changeset)
  end

  def update(conn, %{"id" => id, "team__stats" => team__stats_params}) do
    team__stats = General.get_team__stats!(id)

    case General.update_team__stats(team__stats, team__stats_params) do
      {:ok, team__stats} ->
        conn
        |> put_flash(:info, "Team  stats updated successfully.")
        |> redirect(to: Routes.team__stats_path(conn, :show, team__stats))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", team__stats: team__stats, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    team__stats = General.get_team__stats!(id)
    {:ok, _team__stats} = General.delete_team__stats(team__stats)

    conn
    |> put_flash(:info, "Team  stats deleted successfully.")
    |> redirect(to: Routes.team__stats_path(conn, :index))
  end
end
