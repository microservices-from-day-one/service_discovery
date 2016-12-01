require 'service_discovery/version'
require 'consul/client'

module ServiceDiscovery
  class << self

    def url_for(service_name)
      client = Consul::Client.v1.http
      service_details = client.get("/catalog/service/#{service_name}").first
      # TODO raise if there is no service data
      endpoint_parts = []
      if service_details["ServiceAddress"].empty?
        endpoint_parts << "http://localhost"
      else
        service_details["ServiceAddress"]
      end
      endpoint_parts << service_details["ServicePort"]
      URI.parse(endpoint_parts.join(":")).to_s
    end

  end
end
