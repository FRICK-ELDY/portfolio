defmodule TopWeb.PageController do
  use TopWeb, :controller

  def home(conn, _params) do
    Gettext.put_locale(Shared.Gettext, "ja")
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end
