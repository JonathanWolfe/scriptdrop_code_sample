defmodule ScriptdropCodeSampleWeb.PageView do
  use ScriptdropCodeSampleWeb, :view

  alias ScriptdropCodeSample.Accounts.Courier
  alias ScriptdropCodeSample.Repo

  def couriers() do
    Repo.all(Courier)
  end
end
