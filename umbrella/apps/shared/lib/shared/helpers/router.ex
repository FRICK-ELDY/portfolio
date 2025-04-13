defmodule Shared.Helpers.Router do
  @moduledoc "Routing Macro Collections"

  defmacro localized_routes do
    paths = ["/", "/:locale"]

    routes =
      for path <- paths do
        quote do
          live(unquote(path), TopLive)
        end
      end

    quote do
      live_session :locale, session: {Shared.Session, :build, []} do
        (unquote_splicing(routes))
      end
    end
  end
end
