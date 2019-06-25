# frozen_string_literal: true

module ApplicationHelper
  def display_header?
    # it skips headers in case of post because of potential errors
    # otherwise user has scroll down too much in order to see errors
    !request.url.match?(/\/profile/)
  end
end
