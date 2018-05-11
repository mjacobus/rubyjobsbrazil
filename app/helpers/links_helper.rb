# frozen_string_literal: true

module LinksHelper
  def button_link(url, classes = nil, options = {}, &block)
    classes = [options[:class], 'button', classes].compact
    options[:class] = classes
    link_to url, options, &block
  end

  def new_link(url = { action: :new }, options = {})
    options.reverse_merge!(title: t('app.links.new'))

    link_to(url, options) do
      [new_icon, t('app.links.new')].join(' ').html_safe
    end
  end

  def edit_link(url, options = {})
    options.reverse_merge!(title: t('app.links.edit'))
    button_link(url, 'warning tiny', options) do
      edit_icon
    end
  end

  def destroy_link(url, options = {})
    options.reverse_merge!(
      method: :delete,
      data: { confirm: t('app.messages.confirm_destroy') },
      title: t('app.links.destroy')
    )
    button_link(url, 'alert tiny', options) do
      destroy_icon
    end
  end

  def show_link(url, options = {})
    options.reverse_merge!(title: t('app.links.show'))
    button_link(url, 'secondary tiny', options) do
      show_icon
    end
  end

  def back_link(url = { action: :index }, options = {})
    button_link(url, 'warning', options) do
      t('app.links.back')
    end
  end

  def cancel_link(url = { action: :index }, options = {})
    button_link(url, 'alert', options) do
      t('app.links.cancel')
    end
  end

  def submit_button
    action = params[:action]
    content_tag(:button, t("app.submit.#{action}"), class: 'success')
  end
end
