# frozen_string_literal: true

require 'makeup'

module Recruiter
  module MarkdownHelper
    def to_markdown(text)
      sanitize(renderer.render('file.md', text).html_safe)
    end

    def renderer
      @md_renderer ||= Makeup::Markup.new(
        highlighter: Makeup::SyntaxHighlighter.new
      )
    end
  end
end
