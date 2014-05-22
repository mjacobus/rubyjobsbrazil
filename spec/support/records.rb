module Records
  extend ActiveSupport::Concern

  included do
    let(:user)   { User.make! }
    let(:user2)  { User.make! }
    let(:user3)  { User.make! }
  end
end
