defmodule Shared.Helpers.Router do
  @moduledoc "Routing Macro Collections"

  defmacro localized_routes do
    paths = [
      {"/", AboutLive},
      {"/:locale", AboutLive}
    ]

    routes =
      for {path, mod} <- paths do
        quote do
          live(unquote(path), unquote(mod))
        end
      end

    quote do
      live_session :locale, session: {Shared.Session, :build, []} do
        (unquote_splicing(routes))
      end
    end
  end
end
