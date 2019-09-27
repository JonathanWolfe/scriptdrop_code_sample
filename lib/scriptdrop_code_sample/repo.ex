defmodule ScriptdropCodeSample.Repo do
  use Ecto.Repo,
    otp_app: :scriptdrop_code_sample,
    adapter: Ecto.Adapters.Postgres
end
