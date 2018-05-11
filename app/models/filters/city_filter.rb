# frozen_string_literal: true

module Filters
  class CityFilter < Base
    def init_query
      @query = City.order('name')
    end

    def with_jobs(*_args)
      merge(query.where(id: Job.select(:city_id)))
    end

    def with_open_jobs(*_args)
      merge(City.with_open_jobs)
    end

    def with_state_id(id)
      merge(query.where(state_id: id))
    end
  end
end
