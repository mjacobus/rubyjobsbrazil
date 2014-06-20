class RenameTables < ActiveRecord::Migration
  def change
    %w(states cities jobs users tags jobs_tags).each do |table|
      rename_table table, "recruiter_#{table}"
    end
  end
end
