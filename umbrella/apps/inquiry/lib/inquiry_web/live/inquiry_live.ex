defmodule InquiryWeb.InquiryLive do
  use InquiryWeb, :live_view

  def render(assigns), do: Phoenix.View.render(InquiryWeb.InquiryLiveView, "main.html", assigns)

  def mount(params, session, socket) do
    locale = params["locale"] || session["locale"]
    Gettext.put_locale(Shared.Gettext, locale)

    socket =
      socket
      |> assign(:page_title, "Inquiry")
      |> assign(:locale, locale)
      |> assign(
        :message,
        InquiryWeb.InquiryLiveView.t("Peace of mind from prototype to production.")
      )

    {:ok, socket}
  end
end
