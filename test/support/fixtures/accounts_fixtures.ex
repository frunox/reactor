defmodule Reactor.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Reactor.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        is_verified: true,
        name: "some name",
        password_hash: "some password_hash",
        website: "some website"
      })
      |> Reactor.Accounts.create_user()

    user
  end
end
