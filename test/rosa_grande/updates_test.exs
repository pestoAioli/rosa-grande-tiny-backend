defmodule RosaGrande.UpdatesTest do
  use RosaGrande.DataCase

  alias RosaGrande.Updates

  describe "updates" do
    alias RosaGrande.Updates.Update

    import RosaGrande.UpdatesFixtures

    @invalid_attrs %{title: nil, body: nil, photo_url: nil}

    test "list_updates/0 returns all updates" do
      update = update_fixture()
      assert Updates.list_updates() == [update]
    end

    test "get_update!/1 returns the update with given id" do
      update = update_fixture()
      assert Updates.get_update!(update.id) == update
    end

    test "create_update/1 with valid data creates a update" do
      valid_attrs = %{title: "some title", body: "some body", photo_url: "some photo_url"}

      assert {:ok, %Update{} = update} = Updates.create_update(valid_attrs)
      assert update.title == "some title"
      assert update.body == "some body"
      assert update.photo_url == "some photo_url"
    end

    test "create_update/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Updates.create_update(@invalid_attrs)
    end

    test "update_update/2 with valid data updates the update" do
      update = update_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body", photo_url: "some updated photo_url"}

      assert {:ok, %Update{} = update} = Updates.update_update(update, update_attrs)
      assert update.title == "some updated title"
      assert update.body == "some updated body"
      assert update.photo_url == "some updated photo_url"
    end

    test "update_update/2 with invalid data returns error changeset" do
      update = update_fixture()
      assert {:error, %Ecto.Changeset{}} = Updates.update_update(update, @invalid_attrs)
      assert update == Updates.get_update!(update.id)
    end

    test "delete_update/1 deletes the update" do
      update = update_fixture()
      assert {:ok, %Update{}} = Updates.delete_update(update)
      assert_raise Ecto.NoResultsError, fn -> Updates.get_update!(update.id) end
    end

    test "change_update/1 returns a update changeset" do
      update = update_fixture()
      assert %Ecto.Changeset{} = Updates.change_update(update)
    end
  end
end
