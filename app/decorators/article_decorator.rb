# frozen_string_literal: true

class ArticleDecorator < ApplicationDecorator
  def published?
    decorate_boolean(object.published?)
  end
end
