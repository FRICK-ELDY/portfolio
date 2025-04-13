defmodule TopWeb.TopLive do
  use TopWeb, :live_view

  def render(assigns), do: Phoenix.View.render(TopWeb.TopLiveView, "main.html", assigns)

  def mount(params, session, socket) do
    locale = params["locale"] || session["locale"]
    Gettext.put_locale(Shared.Gettext, locale)

    socket =
      socket
      |> assign(:page_title, "Top")
      |> assign(:message, TopWeb.TopLiveView.t("Peace of mind from prototype to production."))

    {:ok, socket}
  end
end
