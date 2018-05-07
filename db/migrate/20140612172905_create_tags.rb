# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :recruiter_tags do |t|
      t.string :name
      t.text :description
      t.integer :sequence, default: 10, null: false

      t.timestamps
    end
    add_index :recruiter_tags, :name, unique: true
  end
end
