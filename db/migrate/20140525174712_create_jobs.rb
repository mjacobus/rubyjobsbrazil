class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.text :how_to_apply
      t.references :user, index: true

      t.timestamps
    end
  end
end
