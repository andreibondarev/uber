require "uber/version"
require "uber/client"
require "uber/products"
require "uber/price_estimates"
require "uber/time_estimates"

module Uber
  class Error < StandardError; end
  class InvalidArgumentError < Error; end
  class AuthenticationError < Error; end
end
