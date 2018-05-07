# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :recruiter_cities do |t|
      t.string :name
      t.string :short
      t.references :state

      t.timestamps
    end
  end
end
