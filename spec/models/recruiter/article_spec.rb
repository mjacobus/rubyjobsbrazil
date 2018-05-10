require 'rails_helper'

module Recruiter
  describe Article do
    it { should belong_to(:user) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }

    it 'has url frield url' do
      subject.id = 1
      subject.title = 'Foo Article'
      expect(subject.to_param).to eq('1-foo-article')
    end

    specify 'its is ordered by id id desc' do
      article1 = Article.make!
      article2 = Article.make!(updated_at: 2.minutes.from_now)

      expect(Article.all).to eq([article2, article1])
    end
  end
end
