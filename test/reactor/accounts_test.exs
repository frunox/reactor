defmodule Reactor.AccountsTest do
  use Reactor.DataCase

  alias Reactor.Accounts

  describe "users" do
    alias Reactor.Accounts.User

    import Reactor.AccountsFixtures

    @invalid_attrs %{email: nil, is_verified: nil, name: nil, password_hash: nil, website: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", is_verified: true, name: "some name", password_hash: "some password_hash", website: "some website"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.is_verified == true
      assert user.name == "some name"
      assert user.password_hash == "some password_hash"
      assert user.website == "some website"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", is_verified: false, name: "some updated name", password_hash: "some updated password_hash", website: "some updated website"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.is_verified == false
      assert user.name == "some updated name"
      assert user.password_hash == "some updated password_hash"
      assert user.website == "some updated website"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
