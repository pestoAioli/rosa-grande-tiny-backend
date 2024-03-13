defmodule RosaGrandeWeb.UpdateController do
  use RosaGrandeWeb, :controller

  alias RosaGrande.Updates
  alias RosaGrande.Updates.Update

  action_fallback RosaGrandeWeb.FallbackController

  def index(conn, _params) do
    updates = Updates.list_updates()
    render(conn, :index, updates: updates)
  end

  def create(conn, %{"update" => update_params}) do
    with {:ok, %Update{} = update} <- Updates.create_update(update_params) do
      conn
      |> put_status(:created)
      |> render(:show, update: update)
    end
  end

  def show(conn, %{"id" => id}) do
    update = Updates.get_update!(id)
    render(conn, :show, update: update)
  end

  def update(conn, %{"id" => id, "update" => update_params}) do
    update = Updates.get_update!(id)

    with {:ok, %Update{} = update} <- Updates.update_update(update, update_params) do
      render(conn, :show, update: update)
    end
  end

  def delete(conn, %{"id" => id}) do
    update = Updates.get_update!(id)

    IO.inspect(update)

    Updates.delete_update()
    send_resp(conn, :no_content, "")
  end
end
