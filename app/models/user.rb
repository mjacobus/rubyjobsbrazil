class User < ActiveRecord::Base
  devise :omniauthable, :trackable
  serialize :provider_data, JSON

  validates :name, presence: true

  validates :email, presence: true, email: true, uniqueness: {
    case_sensitive: false
  }

  validates :uid, uniqueness: { case_sensitive: false, scope: :provider }
end
