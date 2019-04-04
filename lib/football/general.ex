defmodule Football.General do
  @moduledoc """
  The General context.
  """
  require IEx

  import Ecto.Query, warn: false
  alias Football.Repo

  alias Football.General.Team

  @doc """
  Returns the list of teams.

  ## Examples

      iex> list_teams()
      [%Team{}, ...]

  """
  def list_teams do
    Repo.all(Team)
  end

  @doc """
  Gets a single team.

  Raises `Ecto.NoResultsError` if the Team does not exist.

  ## Examples

      iex> get_team!(123)
      %Team{}

      iex> get_team!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team!(id), do: Repo.get!(Team, id)

  @doc """
  Creates a team.

  ## Examples

      iex> create_team(%{field: value})
      {:ok, %Team{}}

      iex> create_team(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team.

  ## Examples

      iex> update_team(team, %{field: new_value})
      {:ok, %Team{}}

      iex> update_team(team, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team(%Team{} = team, attrs) do
    team
    |> Team.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Team.

  ## Examples

      iex> delete_team(team)
      {:ok, %Team{}}

      iex> delete_team(team)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team(%Team{} = team) do
    Repo.delete(team)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team changes.

  ## Examples

      iex> change_team(team)
      %Ecto.Changeset{source: %Team{}}

  """
  def change_team(%Team{} = team) do
    Team.changeset(team, %{})
  end

  alias Football.General.Game

  @doc """
  Returns the list of games.

  ## Examples

      iex> list_games()
      [%Game{}, ...]

  """
  def list_games do
    Repo.all(Game)
  end

  @doc """
  Gets a single game.

  Raises `Ecto.NoResultsError` if the Game does not exist.

  ## Examples

      iex> get_game!(123)
      %Game{}

      iex> get_game!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game!(id), do: Repo.get!(Game, id)

  @doc """
  Creates a game.

  ## Examples

      iex> create_game(%{field: value})
      {:ok, %Game{}}

      iex> create_game(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game(attrs \\ %{}) do
    team1 = Repo.all(from t in Team, where: t.id == ^1) |> hd()
    attrs = Map.put(attrs, "team1_name", team1.name)

    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game.

  ## Examples

      iex> update_game(game, %{field: new_value})
      {:ok, %Game{}}

      iex> update_game(game, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Game.

  ## Examples

      iex> delete_game(game)
      {:ok, %Game{}}

      iex> delete_game(game)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game changes.

  ## Examples

      iex> change_game(game)
      %Ecto.Changeset{source: %Game{}}

  """
  def change_game(%Game{} = game) do
    Game.changeset(game, %{})
  end

  alias Football.General.Score

  @doc """
  Returns the list of score.

  ## Examples

      iex> list_score()
      [%Score{}, ...]

  """

  alias Football.General.Team_Stats
  alias Football.General.Team

  @doc """
  Returns the list of team_stats.

  ## Examples

      iex> list_team_stats()
      [%Team_Stats{}, ...]

  """
  def list_team_stats do
    Repo.all(Team_Stats)
  end

  def list_team_stats_score do
    Repo.all(
      from ts in Team_Stats,
        left_join: t in Team,
        on: t.id == ts.team_id,
        select: %{
          name: t.name,
          gp: ts.games_played,
          w: ts.games_won,
          d: ts.games_draw,
          l: ts.games_lost,
          gd: ts.goal_difference,
          t: ts.points
        }
    )
  end

  @doc """
  Gets a single team__stats.

  Raises `Ecto.NoResultsError` if the Team  stats does not exist.

  ## Examples

      iex> get_team__stats!(123)
      %Team_Stats{}

      iex> get_team__stats!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team__stats!(id), do: Repo.get!(Team_Stats, id)

  @doc """
  Creates a team__stats.

  ## Examples

      iex> create_team__stats(%{field: value})
      {:ok, %Team_Stats{}}

      iex> create_team__stats(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team__stats(attrs \\ %{}) do
    %Team_Stats{}
    |> Team_Stats.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team__stats.

  ## Examples

      iex> update_team__stats(team__stats, %{field: new_value})
      {:ok, %Team_Stats{}}

      iex> update_team__stats(team__stats, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team__stats(%Team_Stats{} = team__stats, attrs) do
    team__stats
    |> Team_Stats.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Team_Stats.

  ## Examples

      iex> delete_team__stats(team__stats)
      {:ok, %Team_Stats{}}

      iex> delete_team__stats(team__stats)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team__stats(%Team_Stats{} = team__stats) do
    Repo.delete(team__stats)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team__stats changes.

  ## Examples

      iex> change_team__stats(team__stats)
      %Ecto.Changeset{source: %Team_Stats{}}

  """
  def change_team__stats(%Team_Stats{} = team__stats) do
    Team_Stats.changeset(team__stats, %{})
  end
end
