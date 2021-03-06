module Fog
  module Compute
    class Brightbox
      class Real

        def list_servers(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/1.0/servers",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end
    end
  end
end