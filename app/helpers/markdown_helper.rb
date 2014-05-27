module MarkdownHelper
  def to_markdown(text)
    renderer.render(text).html_safe
  end

  def renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
