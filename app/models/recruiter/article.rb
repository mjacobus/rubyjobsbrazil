# frozen_string_literal: true

module Recruiter
  class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :user, presence: true
    validates :body, presence: true

    default_scope -> { order('updated_at DESC') }
    scope :published, -> { where(published: true) }

    def to_param
      "#{id}-#{title.parameterize}"
    end
  end
end
