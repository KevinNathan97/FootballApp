defmodule FootballWeb.Team_StatsControllerTest do
  use FootballWeb.ConnCase

  alias Football.General

  @create_attrs %{games_draw: 42, games_lost: 42, games_played: 42, games_won: 42, goal_difference: 42, points: 42, team_id: 42}
  @update_attrs %{games_draw: 43, games_lost: 43, games_played: 43, games_won: 43, goal_difference: 43, points: 43, team_id: 43}
  @invalid_attrs %{games_draw: nil, games_lost: nil, games_played: nil, games_won: nil, goal_difference: nil, points: nil, team_id: nil}

  def fixture(:team__stats) do
    {:ok, team__stats} = General.create_team__stats(@create_attrs)
    team__stats
  end

  describe "index" do
    test "lists all team_stats", %{conn: conn} do
      conn = get(conn, Routes.team__stats_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Team stats"
    end
  end

  describe "new team__stats" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.team__stats_path(conn, :new))
      assert html_response(conn, 200) =~ "New Team  stats"
    end
  end

  describe "create team__stats" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.team__stats_path(conn, :create), team__stats: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.team__stats_path(conn, :show, id)

      conn = get(conn, Routes.team__stats_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Team  stats"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.team__stats_path(conn, :create), team__stats: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Team  stats"
    end
  end

  describe "edit team__stats" do
    setup [:create_team__stats]

    test "renders form for editing chosen team__stats", %{conn: conn, team__stats: team__stats} do
      conn = get(conn, Routes.team__stats_path(conn, :edit, team__stats))
      assert html_response(conn, 200) =~ "Edit Team  stats"
    end
  end

  describe "update team__stats" do
    setup [:create_team__stats]

    test "redirects when data is valid", %{conn: conn, team__stats: team__stats} do
      conn = put(conn, Routes.team__stats_path(conn, :update, team__stats), team__stats: @update_attrs)
      assert redirected_to(conn) == Routes.team__stats_path(conn, :show, team__stats)

      conn = get(conn, Routes.team__stats_path(conn, :show, team__stats))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, team__stats: team__stats} do
      conn = put(conn, Routes.team__stats_path(conn, :update, team__stats), team__stats: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Team  stats"
    end
  end

  describe "delete team__stats" do
    setup [:create_team__stats]

    test "deletes chosen team__stats", %{conn: conn, team__stats: team__stats} do
      conn = delete(conn, Routes.team__stats_path(conn, :delete, team__stats))
      assert redirected_to(conn) == Routes.team__stats_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.team__stats_path(conn, :show, team__stats))
      end
    end
  end

  defp create_team__stats(_) do
    team__stats = fixture(:team__stats)
    {:ok, team__stats: team__stats}
  end
end
