# This migration comes from recruiter (originally 20140712201534)
class CreateRecruiterArticles < ActiveRecord::Migration
  def change
    create_table :recruiter_articles do |t|
      t.string :title
      t.text :body
      t.references :user, index: true
      t.boolean :published, index: true, default: false

      t.timestamps
    end
  end
end
