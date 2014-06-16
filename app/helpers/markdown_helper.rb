module MarkdownHelper
  def to_markdown(text)
    renderer.render(text).html_safe
  end

  def renderer
    @renderer    ||= Redcarpet::Render::HTML.new(filter_html: true)
    @md_renderer ||= Redcarpet::Markdown.new(@renderer)
  end
end
