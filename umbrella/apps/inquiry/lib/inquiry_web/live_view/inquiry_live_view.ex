defmodule InquiryWeb.InquiryLiveView do
  use InquiryWeb, :view

  @gettext_domain "inquiry"

  def t(text) do
    Gettext.dgettext(Shared.Gettext, @gettext_domain, text)
  end

  def t(text, bindings) when is_list(bindings) do
    Gettext.dgettext(Shared.Gettext, @gettext_domain, text, bindings)
  end
end
