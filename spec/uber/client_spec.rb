require 'spec_helper'

describe Uber::Client do

  SECRET_TOKEN 	= 'xyzabc123'
  CLIENT_ID 	= '1234567890'
  SECRET    	= 'abracadabra'

  let(:client) {
    Uber::Client.new({
      server_token: SECRET_TOKEN,
      client_id: CLIENT_ID,
      secret: SECRET
    })
  }

  describe "new/initialize" do

    it "can be created with just a :server_token" do
      expect {
        Uber::Client.new({server_token: SECRET_TOKEN})
      }.to_not raise_error
    end

    it "can be created with both a :client_id and :secret" do
      expect {
        Uber::Client.new({
          client_id: CLIENT_ID,
          secret: SECRET
       	})
      }.to_not raise_error
    end

    it "cannot be created with just a :client_id" do
      expect {
        Uber::Client.new({client_id: CLIENT_ID})
      }.to raise_error
    end

    it "cannot be created with just a :secret" do
      expect {
        Uber::Client.new({secret: SECRET})
      }.to raise_error
    end

    it "cannot be created without either a :server_token or a :client_id and :secret" do
      expect {
        Uber::Client.new({})
      }.to raise_error
    end

    it "saves credential information" do
      creds = {
        server_token: SECRET_TOKEN,
        client_id: CLIENT_ID,
        secret: SECRET
      }

      r = Uber::Client.new(creds)

      expect(r.server_token).to eq(creds[:server_token])
      expect(r.client_id).to eq(creds[:client_id])
      expect(r.secret).to eq(creds[:secret])
    end

  end

  describe "host" do

    it "knows the API host" do
      expect(client.host).to eq('api.uber.com')
    end

  end

  describe "connection" do

    it "has an HTTP connection" do
      expect(client.connection).to be_a(Faraday::Connection)
      expect(client.connection.url_prefix.to_s).to eq("https://api.uber.com/v1")
    end

  end


end