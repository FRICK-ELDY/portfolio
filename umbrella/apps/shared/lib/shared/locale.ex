defmodule Shared.Locale do
  @moduledoc "Utility functions and constants for locale handling"
  @known_locales Gettext.known_locales(Shared.Gettext)
  @excluded_paths ~w(inquiry)a

  def default, do: "ja"
  def known_locales, do: @known_locales
  def excluded_paths, do: @excluded_paths
end
