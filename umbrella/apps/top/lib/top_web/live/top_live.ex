defmodule TopWeb.TopLive do
  use TopWeb, :live_view

  def mount(_params, _session, socket) do
    Gettext.put_locale(Shared.Gettext, "ja")

    socket =
      socket
      |> assign(:page_title, "Top")
      |> assign(:message, dgettext("top", "Peace of mind from prototype to production."))

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="p-10">
      <h1 class="text-4xl font-bold text-blue-600">{@message}</h1>
    </div>
    """
  end
end
