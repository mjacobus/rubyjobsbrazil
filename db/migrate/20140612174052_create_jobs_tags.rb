class CreateJobsTags < ActiveRecord::Migration
  def change
    create_table :jobs_tags do |t|
      t.references :job, index: true
      t.references :tag, index: true
    end

    add_index :jobs_tags, [:job_id, :tag_id], unique: true
  end
end
