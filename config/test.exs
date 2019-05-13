config :marketo_clone, MarketoClone.Repo,
  database: "marketo_clone_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
