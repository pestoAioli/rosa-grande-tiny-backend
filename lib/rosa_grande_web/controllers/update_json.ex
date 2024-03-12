defmodule RosaGrandeWeb.UpdateJSON do
  alias RosaGrande.Updates.Update

  @doc """
  Renders a list of updates.
  """
  def index(%{updates: updates}) do
    %{data: for(update <- updates, do: data(update))}
  end

  @doc """
  Renders a single update.
  """
  def show(%{update: update}) do
    %{data: data(update)}
  end

  defp data(%Update{} = update) do
    %{
      id: update.id,
      title: update.title,
      body: update.body,
      photo_url: update.photo_url
    }
  end
end
