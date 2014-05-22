OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth = {}
################################################################################
# twitter
################################################################################
OmniAuth.config.mock_auth[:twitter] = {
    :provider => 'twitter',
    :uid => '123456',
    :info => {
      :name => 'Example Name'
    }
  }

################################################################################
# google
################################################################################
OmniAuth.config.mock_auth[:google_oauth2] = {
    :provider => 'google_oauth2',
    :uid => '223456',
    :info => {
      :name => 'Example Name',
      :email => "email@google.com",
      :first_name => "Marcelo",
      :last_name => "Jacobus"
    }
  }

################################################################################
# Facebook
################################################################################
OmniAuth.config.mock_auth[:facebook] = {
  :provider => 'facebook',
  :uid => '2234567',
  :info => {
    :nickname => 'jbloggs',
    :email => 'email@facebook.com',
    :name => 'Example Name facebook',
    :first_name => 'Joe',
    :last_name => 'Bloggs',
    :image => '',
    :urls => { :Facebook => '' },
    :location => 'some place',
    :verified => true
  }
}
################################################################################
# Github
################################################################################
OmniAuth.config.mock_auth[:github] = {
    :provider => 'github',
    :uid => '123458',
    :info => {
      :name => 'Example Name',
      :email => "email@google.com",
    }
  }


class OauthHelper
  def self.providers
    OmniAuth.config.mock_auth
  end
end
