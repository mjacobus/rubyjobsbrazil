# This migration comes from recruiter (originally 20140618170904)
class CreateRecruiterJobsTags < ActiveRecord::Migration
  def change
    # create_table :recruiter_jobs_tags do |t|
    #   t.references :job, index: true
    #   t.references :tag, index: true
    # end
    #
    # add_index :recruiter_jobs_tags, [:job_id, :tag_id], unique: true
  end
end
