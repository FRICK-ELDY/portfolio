defmodule TopWeb.PageLive do
  use TopWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :message, "ようこそ！")}
  end

  def render(assigns) do
    ~H"""
    <div class="p-10">
      <h1 class="text-4xl font-bold text-blue-600">{@message}</h1>
    </div>
    """
  end
end
