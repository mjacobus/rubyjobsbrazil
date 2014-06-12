require 'spec_helper'

describe GravatarHelper do
  describe "#gravatar_url" do
    it "returns the gravatar_url" do
      expected = 'http://www.gravatar.com/avatar/cde86a8672983500337cf4a35df392a5'
      expect(helper.gravatar_url("marcelo.jacobus@gmail.com")).to eq(expected)
    end

    it "returns nil if nil" do
      expect(helper.gravatar_url(nil)).to eq(nil)
    end
  end

  describe "#user_avatar_url" do
    it "returns the correct github gravatar" do
      url = "https://avatars.githubusercontent.com/u/226834?"
      user = User.make(provider: 'github', provider_data: {
        provider: 'github',
        info: {
          'image' =>  url,
        }
      })

      expect(helper.user_avatar_url(user)).to eq(url)
    end
  end
end
