defmodule RosaGrandeWeb.Router do
  use RosaGrandeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {RosaGrandeWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RosaGrandeWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  scope "/api", RosaGrandeWeb do
    pipe_through :api
    get "/updates", UpdateController, :index
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
