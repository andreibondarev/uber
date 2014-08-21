require 'uber/version'
require 'uber/base'
require 'uber/products'

class MyRailtie < Rails::Railtie
	initializer 'configure_omniauth_uber' do
		def initialize
	  	Rails.application.config.middleware.use ::OmniAuth::Builder do
	  	  provider :uber, ENV['UBER_CLIENT_ID'], ENV['UBER_CLIENT_SECRET'], scope: 'profile,history'
			end
		end
	end
end

# module Uber
#   class Client
#   end
# end



