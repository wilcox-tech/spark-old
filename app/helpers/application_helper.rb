module ApplicationHelper
  def markdownify(text)
    BlueCloth.new(text).to_html.html_safe
  end
end
