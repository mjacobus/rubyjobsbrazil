# frozen_string_literal: true

# This migration comes from recruiter (originally 20140617180934)
class CreateRecruiterCities < ActiveRecord::Migration[5.2]
  def change
    # create_table :recruiter_cities do |t|
    #   t.string :name
    #   t.string :short
    #   t.references :state
    #
    #   t.timestamps
    #   t.timestamps
    # end
    #
    # add_index :recruiter_cities, :state_id
  end
end
