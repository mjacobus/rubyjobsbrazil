module Recruiter
  class User < ActiveRecord::Base
    devise :omniauthable, :trackable
    has_many :jobs
    has_many :articles
    serialize :provider_data, JSON

    validates :name, presence: true

    validates :uid, uniqueness: { case_sensitive: false, scope: :provider }
  end
end
