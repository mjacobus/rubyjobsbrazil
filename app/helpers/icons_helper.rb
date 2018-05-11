# frozen_string_literal: true

# http://zurb.com/playground/foundation-icon-fonts-3

module IconsHelper
  def icon(name, klass = nil)
    content_tag(:i, nil, class: "fi-#{name} #{klass}")
  end

  def new_icon(klass = nil)
    icon(:plus, klass)
  end

  def mail_icon(klass = nil)
    icon(:mail, klass)
  end

  def edit_icon(klass = nil)
    icon('page-edit', klass)
  end

  def destroy_icon(klass = nil)
    icon(:trash, klass)
  end

  def show_icon(klass = nil)
    icon(:eye, klass)
  end
end
