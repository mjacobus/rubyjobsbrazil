# frozen_string_literal: true

module Filters
  class JobFilter < Base
    def init_query
      @query = Job.joins(city: :state).includes(city: :state)
    end

    def with_open_status(*_args)
      merge(Job.open)
    end

    def with_city_id(id)
      merge { query.where(city_id: id) }
    end

    def with_state_id(id)
      merge { query.where(cities: { state_id: id }) }
    end
  end
end
