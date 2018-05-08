module Recruiter
  module Users
    class UserController < ::RecruiterController
      before_action :authenticate_user!
      respond_to :html, :json
    end
  end
end
