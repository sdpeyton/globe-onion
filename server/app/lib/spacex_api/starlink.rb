module SpaceXAPI
  class Starlink < Client
    class << self
      def query_satellites lat:, lng:
        params = {
          query: {
            latitude: { :$ne => nil },
            longitude: { :$ne => nil }
          },
          # Passing in false was not working for me so I
          # needed to pass in nil here to remove pagination
          # I'm honestly not sure why - passing false worked
          # in postman so this is most likely a problem with
          # httparty
          options: { pagination: nil },
        }

        response = post(path: '/query', body: params)
        serialize_satellites response[:docs]
      end

      private

        def resource
          'starlink'
        end

        def serialize_satellites satellites
          satellites.map do |satellite|
            {
              id: satellite[:id],
              name: satellite[:spaceTrack][:OBJECT_NAME],
              lat: satellite[:latitude],
              lng: satellite[:longitude]
            }
          end
        end
    end
  end
end
