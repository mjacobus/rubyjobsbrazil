# frozen_string_literal: true

module Recruiter
  module Filters
    def self.filter(type, params = {})
      filter_class(type).new(params).filter
    end

    def self.filter_class(type)
      "Recruiter::Filters::#{type.to_s.classify}Filter".constantize
    end

    class Base
      attr_reader :query

      def self.filter(params = {})
        new(params).filter
      end

      def initialize(params = {})
        init_query

        params.each do |key, values|
          method = "with_#{key}"

          if respond_to?(method)
            send(method, *values)
          end
        end
      end

      def init_query; end

      def filter
        query
      end

      def merge(scope = nil)
        @query = query.merge(yield) if block_given?
        @query = query.merge(scope) if scope
        self
      end
    end
  end
end
