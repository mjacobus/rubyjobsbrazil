# frozen_string_literal: true

class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.string :short

      t.timestamps
    end
    add_index :states, :name, unique: true
  end
end
