defmodule Shared.Plugs.ValidateLocale do
  @moduledoc """
  Plug that validates the `locale` parameter in the URL or session.
  """
  import Plug.Conn

  def init(opts), do: opts

  def call(%Plug.Conn{path_info: [segment | _]} = conn, _opts) do
    segment = String.trim_trailing(segment, "/")

    cond do
      segment in Shared.Locale.excluded_paths() ->
        conn

      segment in Shared.Locale.known_locales() ->
        conn

      true ->
        conn
        |> send_resp(404, "Not Found")
        |> halt()
    end
  end

  def call(conn, _opts), do: conn
end
