module Filters
  class StateFilter < Base
    def init_query
      @query = State.order('name')
    end

    def with_jobs(*args)
      merge(query.where(id: Job.joins(city: :state).select(:state_id).uniq))
    end
  end
end
