# frozen_string_literal: true

module HeaderHelper
  def title(title = nil)
    if title
      content_for(:title) { title }
    else
      parts = [content_for(:title)]
      parts << t('app.site_title')
      parts.compact.uniq.join(' :: ')
    end
  end
end
