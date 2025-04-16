defmodule Shared.HtmlView do
  use Phoenix.View,
    root: Path.expand("./view", __DIR__),
    namespace: false,
    pattern: "**/*"
end
