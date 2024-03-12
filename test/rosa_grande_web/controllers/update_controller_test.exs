defmodule RosaGrandeWeb.UpdateControllerTest do
  use RosaGrandeWeb.ConnCase

  import RosaGrande.UpdatesFixtures

  alias RosaGrande.Updates.Update

  @create_attrs %{
    title: "some title",
    body: "some body",
    photo_url: "some photo_url"
  }
  @update_attrs %{
    title: "some updated title",
    body: "some updated body",
    photo_url: "some updated photo_url"
  }
  @invalid_attrs %{title: nil, body: nil, photo_url: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all updates", %{conn: conn} do
      conn = get(conn, ~p"/api/updates")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create update" do
    test "renders update when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/updates", update: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/updates/#{id}")

      assert %{
               "id" => ^id,
               "body" => "some body",
               "photo_url" => "some photo_url",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/updates", update: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update update" do
    setup [:create_update]

    test "renders update when data is valid", %{conn: conn, update: %Update{id: id} = update} do
      conn = put(conn, ~p"/api/updates/#{update}", update: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/updates/#{id}")

      assert %{
               "id" => ^id,
               "body" => "some updated body",
               "photo_url" => "some updated photo_url",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, update: update} do
      conn = put(conn, ~p"/api/updates/#{update}", update: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete update" do
    setup [:create_update]

    test "deletes chosen update", %{conn: conn, update: update} do
      conn = delete(conn, ~p"/api/updates/#{update}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/updates/#{update}")
      end
    end
  end

  defp create_update(_) do
    update = update_fixture()
    %{update: update}
  end
end
