class Cell
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def reincarnate(neighbors)
    Cell.new(coordinates.dup) if neighbors.count == 2
  end

  def ==(cell)
    coordinates == cell.coordinates
  end

  def distance_from(cell)
    coordinates.distance_from(cell.coordinates)
  end
end
