module Queries
  class ClosestSatellites < BaseQuery
    type [Types::SatelliteType], null: false
    description "Find the closest satellite to a given lat/lng point"
    argument :lat, Float, required: true
    argument :lng, Float, required: true
    argument :number_of_satellites, Integer, required: true

    def resolve lat:, lng:, number_of_satellites:
      point = { lat: lat, lng: lng }
      data = SpaceXAPI::Starlink.query_satellites lat: lat, lng: lng
      DistanceToOrigin.new(
        origin: point,
        points: data
      ).sort.first number_of_satellites
    end
  end
end
