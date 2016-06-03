ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Cookbook.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Cookbook.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Cookbook.Repo)

