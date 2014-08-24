module Uber
  class TimeEstimates
    attr_reader :client

    def path
      'estimates/price'
    end

    def initialize(client)
      @client = client
    end

    # Need better method name?
    def arriving_times(start_latitude, start_longitude, customer_uuid=nil, product_id=nil)
      # TODO validate parameters
      # TODO figure out how to send server_token by default
      payload = {
        server_token:     client.server_token,
        start_latitude:   start_latitude,
        start_longitude:  start_longitude,
        end_latitude:     end_latitude,
        end_longitude:    end_longitude
      }
      payload.merge!({ customer_uuid: customer_uuid }) if customer_uuid
      payload.merge!({ product_id: product_id }) if product_id

      client.connection.get(path, payload)
    end
  end
end