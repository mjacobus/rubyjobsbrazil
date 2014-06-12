class UserDecorator < Draper::Decorator
  delegate_all

  def avatar(width = 50, height = 50)
    url ||= image_url
    url ||= gravatar_url
    h.image_tag(url, width: width, height: height)
  end

  def image_url
    @image_url ||= object.provider_data.deep_symbolize_keys[:info][:image]
  end

  def gravatar_url
    if email
      hash = Digest::MD5.hexdigest(email)
      "http://www.gravatar.com/avatar/#{hash}"
    end
  end
end
