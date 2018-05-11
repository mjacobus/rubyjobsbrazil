# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, '#name' do
  it { should validate_presence_of(:name) }
end

RSpec.describe User, '#jobs' do
  it { should have_many(:jobs) }
end

RSpec.describe User, '#articles' do
  it { should have_many(:articles) }
end

RSpec.describe User, '#email' do
  it { should_not validate_presence_of(:email) }
  it { should_not validate_uniqueness_of(:email).case_insensitive }
  # it_validates_email_format_of :email
end

RSpec.describe User, '#uid' do
  it { should validate_uniqueness_of(:uid).case_insensitive.scoped_to(:provider) }
end

RSpec.describe User, '#provider_data' do
  it 'stores json serialized data' do
    data = { 'some' => 'data' }
    user = User.make!(provider_data: data)
    user.reload
    expect(user.provider_data).to eq(data)
  end
end
