# frozen_string_literal: true

module Recruiter
  class Tag < ApplicationRecord
    has_and_belongs_to_many :jobs, class_name: 'Recruiter::Job'
    validates :name, presence: true, uniqueness: { case_sensitive: false }
  end
end
