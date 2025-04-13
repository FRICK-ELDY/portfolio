defmodule TopWeb.AboutLiveView do
  use TopWeb, :view

  @gettext_domain "top"

  def t(text) do
    Gettext.dgettext(Shared.Gettext, @gettext_domain, text)
  end

  def t(text, bindings) when is_list(bindings) do
    Gettext.dgettext(Shared.Gettext, @gettext_domain, text, bindings)
  end
end
