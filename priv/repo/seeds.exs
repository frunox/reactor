# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Reactor.Repo.insert!(%Reactor.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Reactor.Accounts

Accounts.create_user(%{email: "bob@bob.com", name: "Bob", website: "https://alchemist.camp"})
Accounts.create_user(%{email: "sam@test.com", name: "Sam"})
