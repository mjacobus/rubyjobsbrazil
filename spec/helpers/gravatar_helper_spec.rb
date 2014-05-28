require 'spec_helper'

describe GravatarHelper do
  describe "#gravatar_url" do
    it "returns the gravatar_url" do
      expected = 'http://www.gravatar.com/avatar/cde86a8672983500337cf4a35df392a5'
      expect(helper.gravatar_url("marcelo.jacobus@gmail.com")).to eq(expected)
    end
  end
end
