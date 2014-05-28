module GravatarHelper
  def gravatar_url(email)
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end

  def gravatar(email, width = 50, height = 50)
    image_tag(gravatar_url(email), width: width, height: height)
  end
end
