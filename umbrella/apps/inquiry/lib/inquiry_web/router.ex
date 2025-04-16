defmodule InquiryWeb.Router do
  use InquiryWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    # plug Shared.Plugs.ValidateLocale
    plug Shared.Plugs.LocaleStore
    plug :fetch_live_flash
    plug :put_root_layout, html: {InquiryWeb.Layouts, :root}
    plug :put_layout, html: {InquiryWeb.Layouts, :app}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", InquiryWeb do
    pipe_through :api
  end

  scope "/", InquiryWeb do
    pipe_through :browser
    localized_routes(InquiryWeb)
  end
end
