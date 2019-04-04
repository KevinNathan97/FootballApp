defmodule Football.GeneralTest do
  use Football.DataCase

  alias Football.General

  describe "teams" do
    alias Football.General.Team

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> General.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert General.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert General.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = General.create_team(@valid_attrs)
      assert team.name == "some name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = General.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, %Team{} = team} = General.update_team(team, @update_attrs)
      assert team.name == "some updated name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = General.update_team(team, @invalid_attrs)
      assert team == General.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = General.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> General.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = General.change_team(team)
    end
  end

  describe "games" do
    alias Football.General.Game

    @valid_attrs %{team1: 42, team1_name: "some team1_name", team2: 42, team2_name: "some team2_name"}
    @update_attrs %{team1: 43, team1_name: "some updated team1_name", team2: 43, team2_name: "some updated team2_name"}
    @invalid_attrs %{team1: nil, team1_name: nil, team2: nil, team2_name: nil}

    def game_fixture(attrs \\ %{}) do
      {:ok, game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> General.create_game()

      game
    end

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert General.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert General.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      assert {:ok, %Game{} = game} = General.create_game(@valid_attrs)
      assert game.team1 == 42
      assert game.team1_name == "some team1_name"
      assert game.team2 == 42
      assert game.team2_name == "some team2_name"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = General.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, %Game{} = game} = General.update_game(game, @update_attrs)
      assert game.team1 == 43
      assert game.team1_name == "some updated team1_name"
      assert game.team2 == 43
      assert game.team2_name == "some updated team2_name"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = General.update_game(game, @invalid_attrs)
      assert game == General.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = General.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> General.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = General.change_game(game)
    end
  end

  describe "score" do
    alias Football.General.Score

    @valid_attrs %{team1_name: "some team1_name", team1_score: 42, team2_name: "some team2_name", team2_score: 42}
    @update_attrs %{team1_name: "some updated team1_name", team1_score: 43, team2_name: "some updated team2_name", team2_score: 43}
    @invalid_attrs %{team1_name: nil, team1_score: nil, team2_name: nil, team2_score: nil}

    def score_fixture(attrs \\ %{}) do
      {:ok, score} =
        attrs
        |> Enum.into(@valid_attrs)
        |> General.create_score()

      score
    end

    test "list_score/0 returns all score" do
      score = score_fixture()
      assert General.list_score() == [score]
    end

    test "get_score!/1 returns the score with given id" do
      score = score_fixture()
      assert General.get_score!(score.id) == score
    end

    test "create_score/1 with valid data creates a score" do
      assert {:ok, %Score{} = score} = General.create_score(@valid_attrs)
      assert score.team1_name == "some team1_name"
      assert score.team1_score == 42
      assert score.team2_name == "some team2_name"
      assert score.team2_score == 42
    end

    test "create_score/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = General.create_score(@invalid_attrs)
    end

    test "update_score/2 with valid data updates the score" do
      score = score_fixture()
      assert {:ok, %Score{} = score} = General.update_score(score, @update_attrs)
      assert score.team1_name == "some updated team1_name"
      assert score.team1_score == 43
      assert score.team2_name == "some updated team2_name"
      assert score.team2_score == 43
    end

    test "update_score/2 with invalid data returns error changeset" do
      score = score_fixture()
      assert {:error, %Ecto.Changeset{}} = General.update_score(score, @invalid_attrs)
      assert score == General.get_score!(score.id)
    end

    test "delete_score/1 deletes the score" do
      score = score_fixture()
      assert {:ok, %Score{}} = General.delete_score(score)
      assert_raise Ecto.NoResultsError, fn -> General.get_score!(score.id) end
    end

    test "change_score/1 returns a score changeset" do
      score = score_fixture()
      assert %Ecto.Changeset{} = General.change_score(score)
    end
  end

  describe "team_stats" do
    alias Football.General.Team_Stats

    @valid_attrs %{games_draw: 42, games_lost: 42, games_played: 42, games_won: 42, goal_difference: 42, points: 42, team_id: 42}
    @update_attrs %{games_draw: 43, games_lost: 43, games_played: 43, games_won: 43, goal_difference: 43, points: 43, team_id: 43}
    @invalid_attrs %{games_draw: nil, games_lost: nil, games_played: nil, games_won: nil, goal_difference: nil, points: nil, team_id: nil}

    def team__stats_fixture(attrs \\ %{}) do
      {:ok, team__stats} =
        attrs
        |> Enum.into(@valid_attrs)
        |> General.create_team__stats()

      team__stats
    end

    test "list_team_stats/0 returns all team_stats" do
      team__stats = team__stats_fixture()
      assert General.list_team_stats() == [team__stats]
    end

    test "get_team__stats!/1 returns the team__stats with given id" do
      team__stats = team__stats_fixture()
      assert General.get_team__stats!(team__stats.id) == team__stats
    end

    test "create_team__stats/1 with valid data creates a team__stats" do
      assert {:ok, %Team_Stats{} = team__stats} = General.create_team__stats(@valid_attrs)
      assert team__stats.games_draw == 42
      assert team__stats.games_lost == 42
      assert team__stats.games_played == 42
      assert team__stats.games_won == 42
      assert team__stats.goal_difference == 42
      assert team__stats.points == 42
      assert team__stats.team_id == 42
    end

    test "create_team__stats/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = General.create_team__stats(@invalid_attrs)
    end

    test "update_team__stats/2 with valid data updates the team__stats" do
      team__stats = team__stats_fixture()
      assert {:ok, %Team_Stats{} = team__stats} = General.update_team__stats(team__stats, @update_attrs)
      assert team__stats.games_draw == 43
      assert team__stats.games_lost == 43
      assert team__stats.games_played == 43
      assert team__stats.games_won == 43
      assert team__stats.goal_difference == 43
      assert team__stats.points == 43
      assert team__stats.team_id == 43
    end

    test "update_team__stats/2 with invalid data returns error changeset" do
      team__stats = team__stats_fixture()
      assert {:error, %Ecto.Changeset{}} = General.update_team__stats(team__stats, @invalid_attrs)
      assert team__stats == General.get_team__stats!(team__stats.id)
    end

    test "delete_team__stats/1 deletes the team__stats" do
      team__stats = team__stats_fixture()
      assert {:ok, %Team_Stats{}} = General.delete_team__stats(team__stats)
      assert_raise Ecto.NoResultsError, fn -> General.get_team__stats!(team__stats.id) end
    end

    test "change_team__stats/1 returns a team__stats changeset" do
      team__stats = team__stats_fixture()
      assert %Ecto.Changeset{} = General.change_team__stats(team__stats)
    end
  end
end
