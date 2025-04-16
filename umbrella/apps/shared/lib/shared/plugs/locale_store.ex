defmodule Shared.Plugs.LocaleStore do
  @moduledoc """
  Plug to store `locale` param into the session.
  """
  import Plug.Conn

  def init(opts), do: opts

  def call(%Plug.Conn{params: %{"locale" => locale}} = conn, _opts) do
    if locale in Shared.Locale.excluded_paths() do
      put_session(conn, :locale, locale)
    else
      conn
    end
  end

  def call(conn, _opts), do: conn
end
