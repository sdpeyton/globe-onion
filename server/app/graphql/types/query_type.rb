module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    closest_satellites_description = 'Returns the specified number of satellites closest to a given point'

    field :closest_satellites, [Types::SatelliteType], description: closest_satellites_description, null: false do
      argument :lat, Float, required: true
      argument :lng, Float, required: true
      argument :number_of_satellites, Integer, required: true
    end

    def closest_satellites lat:, lng:, number_of_satellites:
      Resolvers::ClosestSatellites.run(
        lat: lat,
        lng: lng,
        number_of_satellites: number_of_satellites
      )
    end
  end
end
