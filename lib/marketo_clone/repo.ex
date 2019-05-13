defmodule MarketoClone.Repo do
  use Ecto.Repo,
    otp_app: :marketo_clone,
    adapter: Ecto.Adapters.Postgres
end
