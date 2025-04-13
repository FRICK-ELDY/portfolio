defmodule Shared.Session do
  @moduledoc "Custom construction of a session to be passed to LiveView"

  def build(conn) do
    %{
      "locale" => Plug.Conn.get_session(conn, :locale) || "ja"
    }
  end
end
