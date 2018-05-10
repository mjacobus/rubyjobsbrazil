module Recruiter
  module Filters
    class StateFilter < Base
      def init_query
        @query = State.order('name')
      end

      def with_jobs(*args)
        # merge(query.where(id: Job.joins(city: :state).select(:state_id).uniq))
        merge(query.where(id: Job.joins(city: :state).select(:state_id)))
      end

      def with_open_jobs(*args)
        merge(State.with_open_jobs)
      end
    end
  end
end
