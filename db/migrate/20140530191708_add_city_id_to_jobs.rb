# frozen_string_literal: true

class AddCityIdToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :recruiter_jobs, :city, index: true
  end
end
