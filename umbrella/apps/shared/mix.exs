defmodule Shared.MixProject do
  use Mix.Project

  def project do
    [
      app: :shared,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gettext, "~> 0.26"},
      {:swoosh, "~> 1.18"},
      {:hackney, "~> 1.18"},
      {:phoenix, "~> 1.7.20"},
      {:phoenix_html, "~> 4.1"},
      {:phoenix_live_view, "~> 1.0.9"},
      {:phoenix_view, "~> 2.0"}
    ]
  end
end
