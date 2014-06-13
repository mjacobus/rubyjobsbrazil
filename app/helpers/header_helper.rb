module HeaderHelper
  def title(title = nil)
    if title
      content_for(:title) { title }
    else
      parts = [content_for(:title)]
      parts << 'Rails Jobs Brazil'
      parts.compact.uniq.join(' :: ')
    end
  end
end
