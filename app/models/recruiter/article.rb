module Recruiter
  class Article < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true
    validates :user, presence: true
    validates :body, presence: true

    default_scope ->{ order('updated_at DESC') }
    scope :published, ->{ where(published: true) }

    def to_param
      "#{id}-#{title.parameterize}"
    end
  end
end
