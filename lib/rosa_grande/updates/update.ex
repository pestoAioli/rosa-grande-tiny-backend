defmodule RosaGrande.Updates.Update do
  use Ecto.Schema
  import Ecto.Changeset

  schema "updates" do
    field :title, :string
    field :body, :string
    field :photo_url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(update, attrs) do
    update
    |> cast(attrs, [:title, :body, :photo_url])
    |> validate_required([:title, :body, :photo_url])
  end
end
