class Grid
  attr_reader :coordinates

  def initialize(coordinates: [])
    @coordinates = coordinates
  end

  def repopulate
    @coordinates = coordinates.map do |coordinate|
      coordinate.repopulate(self)
    end.compact
  end

  def neighbors_of(coordinate)
    coordinates.select { |c| c.distance_from(coordinate) == 1 }
  end
end
