# frozen_string_literal: true

class RenameTables < ActiveRecord::Migration[5.2]
  def change
    %w[states cities jobs users tags jobs_tags articles].each do |table|
      rename_table "recruiter_#{table}", table
    end
  end
end
