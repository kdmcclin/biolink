module ControllerHelpers
    def login_user
        user = FactoryGirl.create(:user)
        sign_in user
    end
end

RSpec.configure do |config|
  config.include ControllerHelpers, :type => :controller
end