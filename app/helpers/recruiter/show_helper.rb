# frozen_string_literal: true

module Recruiter
  module ShowHelper
    def show_for(model)
      if block_given?
        yield AttributeShower.new(model, self)
      end
    end

    class AttributeShower
      attr_reader :object, :helper

      def initialize(object, helper)
        @object = object
        @helper = helper
      end

      def show(attribute)
        render(
          object.class.human_attribute_name(attribute),
          object.send(attribute)
        )
      end

      def render(label, value)
        helper.render('application/show_item', label: label, value: value)
      end
    end
  end
end
