require 'devise'
require 'shoulda/matchers'

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end