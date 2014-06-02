module Records
  extend ActiveSupport::Concern

  included do
    let(:user)   { User.make! }
    let(:user2)  { User.make! }
    let(:user3)  { User.make! }

    let(:city) { City.make! }
    let(:state) { city.state }
  end
end
