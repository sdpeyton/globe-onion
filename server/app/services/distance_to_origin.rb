class DistanceToOrigin
  def initialize(origin:, points:)
    @origin = origin
    @points = points
  end

  def sort
    points.sort_by do |point|
      haversine_distance origin, point
    end
  end

  private

    attr_accessor :origin, :points

    def haversine_distance origin, point
      Haversine.distance(
        origin[:lat], origin[:lng],
        point[:lat], point[:lng]
      )
    end
end
