defmodule MarketoClone.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias MarketoClone.Repo

      import Ecto
      import Ecto.Query
      import MarketoClone.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(MarketoClone.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(MarketoClone.Repo, {:shared, self()})
    end

    :ok
  end
end
