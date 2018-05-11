# frozen_string_literal: true

class ArticleDecorator < Draper::Decorator
  delegate_all

  include DecoratorHelper
  include PublicableDecoratorHelper

  def published?
    decorate_boolean(object.published?)
  end
end
