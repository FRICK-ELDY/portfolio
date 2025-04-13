defmodule Shared.Helpers do
  @moduledoc """
  Dispatch helper modules based on usage context (e.g. :router, :live).
  """
  def router do
    quote do
      import Shared.Helpers.Router
    end
  end

  @doc """
  When used, dispatch to the appropriate.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
