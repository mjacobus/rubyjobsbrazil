# frozen_string_literal: true

class AddEnabledToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :recruiter_jobs, :open, :boolean, default: true
  end
end
