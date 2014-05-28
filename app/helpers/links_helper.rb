module LinksHelper

  def button_link(url, classes = nil, options = {},  &block)
    classes = [options[:class], 'button', classes].compact
    options.merge! class: classes
    link_to url, options, &block
  end

  def new_link(url, options = {}, &block)
    button_link(url, 'success', options, &block)
  end

  def edit_link(url, options = {}, &block)
    options.reverse_merge!({
        title: t('system.links.edit')
    })
    link_to(url, options, &block)
  end

  def destroy_link(url, options = { }, &block)
    options.reverse_merge!({
      method: :delete,
      data: { confirm: t('system.messages.confirm_destroy')},
      title: t('system.links.destroy'),
    })
    link_to(url, options, &block)
  end

  def show_link
    button_link(url, 'warning tiny', options, &block)
  end

  def back_link(url = { action: :index }, options = {}, &block)
    button_link(url, 'warning', options) do
      t('system.links.back')
    end
  end

  def cancel_link(url = { action: :index }, options = {}, &block)
    button_link(url, 'warning', options) do
      t('system.links.cancel')
    end
  end

end
