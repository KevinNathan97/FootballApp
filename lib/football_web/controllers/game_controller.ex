defmodule FootballWeb.GameController do
  use FootballWeb, :controller

  alias Football.General
  alias Football.General.Game
  require IEx

  def index(conn, _params) do
    games = General.list_games()
    render(conn, "index.html", games: games)
  end

  def new(conn, _params) do
    changeset = General.change_game(%Game{})

    teams = General.list_teams()

    render(conn, "new.html", changeset: changeset, teams: teams)
  end

  def create(conn, %{"game" => game_params}) do
    # find the team name

    #  put the team name into the changeset

    case General.create_game(game_params) do
      {:ok, game} ->
        conn
        |> put_flash(:info, "Game created successfully.")
        |> redirect(to: Routes.game_path(conn, :show, game))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    game = General.get_game!(id)
    render(conn, "show.html", game: game)
  end

  def edit(conn, %{"id" => id}) do
    game = General.get_game!(id)
    changeset = General.change_game(game)
    render(conn, "edit.html", game: game, changeset: changeset)
  end

  def update(conn, %{"id" => id, "game" => game_params}) do
    game = General.get_game!(id)

    case General.update_game(game, game_params) do
      {:ok, game} ->
        conn
        |> put_flash(:info, "Game updated successfully.")
        |> redirect(to: Routes.game_path(conn, :show, game))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", game: game, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    game = General.get_game!(id)
    {:ok, _game} = General.delete_game(game)

    conn
    |> put_flash(:info, "Game deleted successfully.")
    |> redirect(to: Routes.game_path(conn, :index))
  end
end
