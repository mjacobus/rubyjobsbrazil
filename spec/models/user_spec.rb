require 'spec_helper'

describe User, "#name" do
  it { should validate_presence_of(:name)  }
end

describe User, "#jobs" do
  it { should have_many(:jobs) }
end

describe User, "#email" do
  it { should_not validate_presence_of(:email)  }
  it { should validate_uniqueness_of(:email).case_insensitive  }
  it_validates_email_format_of :email
end

describe User, "#uid" do
  it { should validate_uniqueness_of(:uid).case_insensitive.scoped_to(:provider)  }
end

describe User, "#provider_data" do
  it "stores json serialized data" do
    data = { 'some' => 'data'  }
    user = User.make!(provider_data: data)
    user.reload
    expect(user.provider_data).to eq(data)
  end
end
