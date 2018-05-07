# frozen_string_literal: true

class RenameTables < ActiveRecord::Migration[5.2]
  def change
    %w[states cities jobs users tags jobs_tags].each do |table|
      rename_table table, "recruiter_#{table}"
    end
  end
end
