class Grid
  attr_reader :coordinates, :position_finder, :coordinate_factory

  def initialize(coordinates: [], position_finder: Coordinate, coordinate_factory: Coordinate)
    @position_finder = position_finder
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
    coordinates.map do |coordinate|
      position_finder.positions_near_coordinate(coordinate)
    end.reduce(&:+).map do |position|
      coordinate_factory.new(position: position) unless coordinates.any? {|c| c.position == position }
    end.compact
  end
end
