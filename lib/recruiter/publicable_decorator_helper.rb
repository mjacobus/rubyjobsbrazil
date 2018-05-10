# frozen_string_literal: true

module Recruiter
  module PublicableDecoratorHelper
    def created_at_ago
      h.time_ago_in_words(object.created_at)
    end

    def updated_at_ago
      h.time_ago_in_words(object.created_at)
    end

    def updated?
      updated_at_ago != created_at_ago
    end

    def published_at
      h.t('recruiter.messages.published_at', time: created_at_ago)
    end

    def updated_at
      h.t('recruiter.messages.updated_at', time: updated_at_ago)
    end

    def publication
      published_at.tap do |string|
        if updated?
          string << ' | ' << updated_at
        end
      end
    end
  end
end
