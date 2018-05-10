# TODO: autoload
require_dependency 'recruiter/decorator_helper'
require_dependency 'recruiter/publicable_decorator_helper'

module Recruiter
  class ArticleDecorator < Draper::Decorator
    delegate_all

    include Recruiter::DecoratorHelper
    include Recruiter::PublicableDecoratorHelper

    def published?
      decorate_boolean(object.published?)
    end
  end
end
