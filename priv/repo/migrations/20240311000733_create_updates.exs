defmodule RosaGrande.Repo.Migrations.CreateUpdates do
  use Ecto.Migration

  def change do
    create table(:updates) do
      add :title, :string
      add :body, :text
      add :photo_url, :string

      timestamps(type: :utc_datetime)
    end
  end
end
