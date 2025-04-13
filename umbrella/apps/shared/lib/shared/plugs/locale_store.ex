defmodule Shared.Plugs.LocaleStore do
  @moduledoc """
  Plug to store `locale` param into the session.
  """
  import Plug.Conn

  def init(opts), do: opts

  def call(%Plug.Conn{params: %{"locale" => locale}} = conn, _opts) do
    put_session(conn, :locale, locale)
  end

  def call(conn, _opts), do: conn
end
