module SpaceXAPI
  class Client
    BASE_URL = 'https://api.spacexdata.com/v4/'

    class << self
      def post path:, body:
        response = HTTParty.post url + path, body: body
        handle_response response
      end

      private

        def url
          BASE_URL + resource
        end

        def resource
          raise NotImplementedError
        end

        def handle_response response
          response.deep_symbolize_keys
        end
    end
  end
end
