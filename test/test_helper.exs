ExUnit.start

Mix.Task.run "ecto.create", ~w(-r DreadnoughtHangar.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r DreadnoughtHangar.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(DreadnoughtHangar.Repo)

