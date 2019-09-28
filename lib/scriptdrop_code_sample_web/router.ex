defmodule ScriptdropCodeSampleWeb.Router do
  use ScriptdropCodeSampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ScriptdropCodeSampleWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/couriers", CourierController
    resources "/patients", PatientController
    resources "/pharmacies", PharmacyController
    resources "/orders", OrderController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ScriptdropCodeSampleWeb do
  #   pipe_through :api
  # end
end
