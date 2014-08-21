require "uber/version"
require "uber/client"

module Uber
  class Error < StandardError; end
  class InvalidArgumentError < Error; end
  class AuthenticationError < Error; end
end
