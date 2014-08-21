module Uber
  class Products < Uber::Base
    def self.list
      # binding.pry
      # TODO figure out why HTTParty constant is not found
      # and require 'httparty' won't work
      HTTParty.get('https://api.uber.com/v1/products')
    end
  end
end