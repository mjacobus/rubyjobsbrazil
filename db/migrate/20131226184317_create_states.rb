class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :short

      t.timestamps
    end
    add_index :states, :name, unique: true
  end
end
