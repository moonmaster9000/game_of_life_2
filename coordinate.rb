class Coordinate
  attr_reader :position, :contents

  def initialize(position: nil, contents: nil)
    @position = position
    @x, @y = @position
    @contents = contents
  end

  def ==(coordinate)
    x == coordinate.x && y == coordinate.y
  end

  def distance_from(coordinate)
    [(coordinate.x - x).abs, (coordinate.y - y).abs].max
  end

  def repopulate(neighbor_finder)
    repopulated_contents = contents.repopulate(neighbor_finder.neighbors_of(self))
    Coordinate.new(position: position, contents: repopulated_contents) if repopulated_contents
  end

  protected
  attr_reader :x, :y
end
