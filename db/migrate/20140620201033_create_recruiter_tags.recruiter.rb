# This migration comes from recruiter (originally 20140618170815)
class CreateRecruiterTags < ActiveRecord::Migration
  def change
    # create_table :recruiter_tags do |t|
    #   t.string :name
    #   t.text :description
    #   t.integer :sequence, default: 10, null: false
    #
    #   t.timestamps
    # end
    #
    # add_index :recruiter_tags, :name, unique: true
  end
end
