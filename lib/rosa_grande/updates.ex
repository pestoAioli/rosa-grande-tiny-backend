defmodule RosaGrande.Updates do
  @moduledoc """
  The Updates context.
  """

  import Ecto.Query, warn: false
  alias RosaGrande.Repo

  alias RosaGrande.Updates.Update

  @doc """
  Returns the list of updates.

  ## Examples

      iex> list_updates()
      [%Update{}, ...]

  """
  def list_updates do
    Repo.all(Update)
  end

  @doc """
  Gets a single update.

  Raises `Ecto.NoResultsError` if the Update does not exist.

  ## Examples

      iex> get_update!(123)
      %Update{}

      iex> get_update!(456)
      ** (Ecto.NoResultsError)

  """
  def get_update!(id), do: Repo.get!(Update, id)

  @doc """
  Creates a update.

  ## Examples

      iex> create_update(%{field: value})
      {:ok, %Update{}}

      iex> create_update(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_update(attrs \\ %{}) do
    Repo.delete_all(Update)

    %Update{}
    |> Update.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a update.

  ## Examples

      iex> update_update(update, %{field: new_value})
      {:ok, %Update{}}

      iex> update_update(update, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_update(%Update{} = update, attrs) do
    update
    |> Update.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a update.

  ## Examples

      iex> delete_update(update)
      {:ok, %Update{}}

      iex> delete_update(update)
      {:error, %Ecto.Changeset{}}

  """
  def delete_update() do
    Repo.delete_all(Update)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking update changes.

  ## Examples

      iex> change_update(update)
      %Ecto.Changeset{data: %Update{}}

  """
  def change_update(%Update{} = update, attrs \\ %{}) do
    Update.changeset(update, attrs)
  end
end
