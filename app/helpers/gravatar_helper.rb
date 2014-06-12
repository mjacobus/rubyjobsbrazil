module GravatarHelper
  def gravatar_url(email)
    if email
      hash = Digest::MD5.hexdigest(email)
      "http://www.gravatar.com/avatar/#{hash}"
    end
  end

  def gravatar(email, width = 50, height = 50)
    url = gravatar_url(email)
    if url
      image_tag(gravatar_url(email), width: width, height: height)
    end
  end

  def user_avatar_url(user)
    method = "#{user.provider}_avatar_url"
    send(method, user) if respond_to?(method)
  end

  def github_avatar_url(user)
    user.provider_data.deep_symbolize_keys[:info][:image]
  end
end
