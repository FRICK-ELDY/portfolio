defmodule Shared.Plugs.ValidateLocale do
  @moduledoc """
  Plug that validates the `locale` parameter in the URL or session.
  """
  import Plug.Conn

  def init(opts), do: opts

  def call(%Plug.Conn{path_info: [segment | _]} = conn, _opts) do
    cond do
      segment in Shared.Locale.excluded_paths() ->
        conn

      segment in Shared.Locale.known_locales() ->
        conn

      true ->
        conn
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
    end
  end

  def call(conn, _opts), do: conn
end
