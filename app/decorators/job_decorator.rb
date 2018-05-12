# frozen_string_literal: true

class JobDecorator < ApplicationDecorator
  def title
    object.title.titleize
  end

  def city
    object.city.name
  end

  def state
    object.city.state.name
  end

  def location
    "#{city}/#{short_state}"
  end

  def short_state
    object.city.state.short
  end

  def tag_names
    tags.map(&:name)
  end
end
