defmodule TopWeb.Router do
  use TopWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug Shared.Plugs.LocaleStore
    plug :fetch_live_flash
    plug :put_root_layout, html: {TopWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TopWeb do
    pipe_through :browser
    localized_routes()
  end

  # Other scopes may use custom stacks.
  # scope "/api", TopWeb do
  #   pipe_through :api
  # end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:top, :dev_routes) do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
