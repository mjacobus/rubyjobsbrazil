# frozen_string_literal: true

class FiltersController < ApplicationController
  def index
    @records = ::Filters.filter(type, params).map do |record|
      { id: record.id, name: record.name }
    end
    render json: @records
  end

  def type
    params.require(:filter)
  end
end
