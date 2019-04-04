defmodule Football.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :team1, :integer
      add :team2, :integer
      add :team1_name, :string
      add :team2_name, :string

      timestamps()
    end

  end
end
