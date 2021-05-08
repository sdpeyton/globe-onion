module Types
  class SatelliteType < Types::BaseObject
    graphql_name "Satellite"
    description "A satellite from the spacex api"

    field :id, ID, null: false
    field :name, String, null: false
    field :lat, Float, null: false
    field :lng, Float, null: false
  end
end
