defmodule Shared.Gettext do
  @moduledoc """
  Provides the shared Gettext backend for internationalization (i18n).

  This module is used by multiple applications in the umbrella project
  to enable consistent and centralized translation support.
  """

  use Gettext.Backend, otp_app: :shared
end
