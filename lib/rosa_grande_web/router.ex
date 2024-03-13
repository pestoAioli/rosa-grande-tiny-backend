defmodule RosaGrandeWeb.Router do
  use RosaGrandeWeb, :router

  import RosaGrandeWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["json"]
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_current_user
  end

  scope "/", RosaGrandeWeb do
    pipe_through :browser

    post "/users/register", UserAuthController, :register
    post "/users/log_in", UserAuthController, :login
    get "/updates", UpdateController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", RosaGrandeWeb do
    pipe_through :api

    post "/updates", UpdateController, :create
    patch "/updates", UpdateController, :update
    delete "/updates", UpdateController, :delete
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:rosa_grande, :dev_routes) do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
