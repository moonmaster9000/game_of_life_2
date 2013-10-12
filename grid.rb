class Grid
  attr_reader :coordinates, :coordinate_factory

  def initialize(coordinates: [], coordinate_factory: Coordinate)
    @coordinate_factory = coordinate_factory
    @coordinates = coordinates
  end

  def repopulate
    @coordinates = coordinates.map do |coordinate|
      coordinate.repopulate(self)
    end.compact + nearby_coordinates.map do |coordinate|
      coordinate.repopulate(self)
    end.compact
  end

  def neighbors_of(coordinate)
    coordinates.select { |c| c.distance_from(coordinate) == 1 }
  end

  private
  def nearby_coordinates
    nearby_positions.map do |position|
      coordinate_factory.new(position: position) unless coordinates.any? {|c| c.position == position }
    end.compact
  end

  def nearby_positions
    coordinates.collect(&:neighboring_positions).reduce(&:+)
  end
end
