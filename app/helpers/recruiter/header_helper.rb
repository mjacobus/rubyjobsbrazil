# frozen_string_literal: true

module Recruiter
  module HeaderHelper
    def title(title = nil)
      if title
        content_for(:title) { title }
      else
        parts = [content_for(:title)]
        parts << t('recruiter.site_title')
        parts.compact.uniq.join(' :: ')
      end
    end
  end
end
