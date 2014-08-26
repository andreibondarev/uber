module Uber
  class PriceEstimates
    attr_reader :client

    def path
      'estimates/price'
    end

    def initialize(client)
      @client = client
    end

    # Need better method name?
    def price(start_latitude, start_longitude, end_latitude, end_longitude)
      # TODO validate parameters
      # TODO figure out how to send server_token by default
      client.connection.get(path,
        {
          server_token:     client.server_token,
          start_latitude:   start_latitude,
          start_longitude:  start_longitude,
          end_latitude:     end_latitude,
          end_longitude:    end_longitude
        }
      )
    end
  end
end