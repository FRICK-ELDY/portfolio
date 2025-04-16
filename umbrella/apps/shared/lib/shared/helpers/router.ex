defmodule Shared.Helpers.Router do
  @moduledoc "Routing Macro Collections"

  defmacro localized_routes(base_module_ast) do
    base_module = Macro.expand(base_module_ast, __CALLER__)

    paths =
      case base_module do
        TopWeb ->
          [
            {"/", AboutLive},
            {"/:locale", AboutLive}
          ]

        InquiryWeb ->
          [
            {"/inquiry", InquiryLive},
            {"/:locale/inquiry", InquiryLive}
          ]

        _ ->
          raise ArgumentError, "Unsupported module for localized routes: #{inspect(base_module)}"
      end

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
