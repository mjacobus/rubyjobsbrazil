# frozen_string_literal: true

require 'rails_helper'

module Recruiter
  describe UserDecorator do
    describe '#image_url' do
      it 'returns the correct image url' do
        url = 'https://avatars.githubusercontent.com/u/226834?'
        user = User.make(provider_data: { info: { 'image' => url } })
        decorator = UserDecorator.new(user)

        expect(decorator.image_url).to eq(url)
      end

      describe '#gravatar_url' do
        subject {}
        it 'returns the gravatar_url' do
          user      = User.make(email: 'marcelo.jacobus@gmail.com')
          decorator = UserDecorator.new(user)
          expected  = 'http://www.gravatar.com/avatar/cde86a8672983500337cf4a35df392a5'

          expect(decorator.gravatar_url).to eq(expected)
        end

        it 'returns nil if nil' do
          decorator = UserDecorator.new(User.make(email: nil, provider_data: {}))
          expect(decorator.gravatar_url).to eq(nil)
        end
      end
    end
  end
end
