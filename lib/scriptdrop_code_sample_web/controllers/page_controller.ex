defmodule ScriptdropCodeSampleWeb.PageController do
  use ScriptdropCodeSampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
