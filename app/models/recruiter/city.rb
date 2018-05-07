module Recruiter
  class City < ActiveRecord::Base
    delegate  :to_s, to: :name
    belongs_to :state
    validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :state_id }

    scope :with_open_jobs, ->{ where(id: Job.open.select(:city_id).uniq) }
  end
end
