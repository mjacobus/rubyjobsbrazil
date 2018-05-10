# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :recruiter_jobs do |t|
      t.string :title
      t.text :description
      t.text :how_to_apply
      t.references :user, index: true

      t.timestamps
    end
  end
end
