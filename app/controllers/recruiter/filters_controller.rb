module Recruiter
  class FiltersController < ::RecruiterController
    def index
      @records = ::Recruiter::Filters.filter(type, params).map do |record|
        { id: record.id, name: record.name }
      end
      render json: @records
    end

    def type
      params.require(:filter)
    end
  end
end
