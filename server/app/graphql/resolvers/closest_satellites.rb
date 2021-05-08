module Resolvers
  class ClosestSatellites < BaseResolver
    class << self
      def run lat:, lng:, number_of_satellites:
        point = { lat: lat, lng: lng }
        data = SpaceXAPI::Starlink.get_satellites

        DistanceToOrigin.new(
          origin: point,
          points: data
        ).sort.first number_of_satellites
      end
    end
  end
end
