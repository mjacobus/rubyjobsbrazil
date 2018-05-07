module Recruiter
  class Tag < ActiveRecord::Base
    has_and_belongs_to_many :jobs, class_name: 'Recruiter::Job'
    validates :name, presence: true, uniqueness: { case_sensitive: false }
  end
end
