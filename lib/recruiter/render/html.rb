# frozen_string_literal: true

require 'pygments'

module Recruiter
  module Render
    class HTML < Redcarpet::Render::HTML
      # def initialize(*args)
      #   super(
      #     hard_wrap: true
      #   )
      # end

      def block_code(text, language)
        Pygments.highlight(text, lexer: language)
      rescue StandardError
        Pygments.highlight(text)
      end
    end
  end
end
