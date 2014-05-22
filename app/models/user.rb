class User < ActiveRecord::Base
  devise :omniauthable, :trackable
  serialize :provider_data, JSON
end
