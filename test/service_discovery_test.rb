# -*- encoding : utf-8 -*-
require "test_helper"

describe ServiceDiscovery do
  describe "#url_for" do
    it "loads service host from consul" do
      consul_response =  {"ServiceAddress"=>"", "ServicePort"=>4031}
      Consul::Client::HTTP.any_instance.expects(:get).once.returns([consul_response])

      host = ServiceDiscovery.url_for(:lojas)
      assert_equal "http://localhost:4031", host
    end

    it "properly handles service not in consul" do
      skip("not yet implemented")
    end
  end
end
