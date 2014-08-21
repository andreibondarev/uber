require 'faraday_middleware'

module Uber
  API_HOST      = 'api.uber.com'
  API_VERSION   = 'v1'

  class Client

    attr_accessor :server_token, :client_id, :secret

    def initialize(options)
      @server_token     = options[:server_token]
      @client_id        = options[:client_id]
      @secret           = options[:secret]
      
      unless has_token? or has_credentials?
        missing_parameters = [:client_id, :secret] - options.keys

        if missing_parameters.size == 2
          raise Uber::InvalidArgumentError, "Missing required options - either :server_token or :client_id and :secret must be provided"
        else
          raise Uber::InvalidArgumentError, "Missing required options #{missing_parameters.join(',')}"
        end
      end
    end

    def host
      API_HOST
    end

    def api_version
      API_VERSION
    end

    def base_url
      "https://#{host}/#{api_version}"
    end

    def connection
      @connection ||= Faraday.new(url: base_url) do |conn|
        conn.request    :json
        conn.response   :json
        conn.adapter    Faraday.default_adapter
      end
    end

  private
    def has_token?
      server_token
    end  

    def has_credentials?
      client_id && secret
    end
  end
end