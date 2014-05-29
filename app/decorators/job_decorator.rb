class JobDecorator < Draper::Decorator
  delegate_all

  def created_at_ago
    h.time_ago_in_words(object.created_at)
  end

  def title
    object.title.titleize
  end

  def updated_at_ago
    h.time_ago_in_words(object.created_at)
  end

  def updated?
    object.created_at < object.updated_at
  end

  def published_at
    h.t('system.messages.posts.published_at', time: created_at_ago)
  end

  def updated_at
    h.t('system.messages.posts.updated_at', time: updated_at_ago)
  end
end
