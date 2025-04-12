defmodule TopWeb.TopLive do
  use TopWeb, :live_view

  def render(assigns), do: Phoenix.View.render(TopWeb.TopLiveView, "main.html", assigns)

  def mount(_params, _session, socket) do
    Gettext.put_locale(Shared.Gettext, "ja")

    socket =
      socket
      |> assign(:page_title, "Top")
      |> assign(:message, TopWeb.TopLiveView.t("Peace of mind from prototype to production."))

    {:ok, socket}
  end
end
