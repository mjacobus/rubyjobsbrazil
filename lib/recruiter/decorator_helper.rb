# frozen_string_literal: true

module Recruiter
  module DecoratorHelper
    def decorate_boolean(value)
      I18n.t(value.to_s)
    end
  end
end
