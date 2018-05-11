# frozen_string_literal: true

module Filters
  class StateFilter < Base
    def init_query
      @query = State.order('name')
    end

    def with_jobs(*_args)
      merge(query.where(id: Job.joins(city: :state).select(:state_id)))
    end

    def with_open_jobs(*_args)
      merge(State.with_open_jobs)
    end
  end
end
