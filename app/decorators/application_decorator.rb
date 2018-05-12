# frozen_string_literal: true

class ApplicationDecorator < Draper::Decorator
  delegate_all

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
    h.t('app.messages.published_at', time: created_at_ago)
  end

  def updated_at
    h.t('app.messages.updated_at', time: updated_at_ago)
  end

  def publication
    published_at.tap do |string|
      if updated?
        string << ' | ' << updated_at
      end
    end
  end

  private

  def decorate_boolean(value)
    I18n.t(value.to_s)
  end
end
