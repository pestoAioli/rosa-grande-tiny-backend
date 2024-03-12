defmodule RosaGrande.UpdatesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RosaGrande.Updates` context.
  """

  @doc """
  Generate a update.
  """
  def update_fixture(attrs \\ %{}) do
    {:ok, update} =
      attrs
      |> Enum.into(%{
        body: "some body",
        photo_url: "some photo_url",
        title: "some title"
      })
      |> RosaGrande.Updates.create_update()

    update
  end
end
