module Uber
  class Products
    attr_reader :client

    def path
      'products'
    end

    def initialize(client)
      @client = client
    end

    def list(latitude, longitude)
      # TODO validate parameters
      # TODO figure out how to send server_token by default
      client.connection.get(path, { server_token: client.server_token, latitude: latitude, longitude: longitude})
    end
  end
end