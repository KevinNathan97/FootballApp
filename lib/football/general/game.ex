defmodule Football.General.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :team1, :integer
    field :team1_name, :string
    field :team2, :integer
    field :team2_name, :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:team1, :team2, :team1_name, :team2_name])
    |> validate_required([:team1, :team2])
  end
end
