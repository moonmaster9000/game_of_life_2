class Coordinates
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end


  def ==(coordinates)
    x == coordinates.x && y == coordinates.y
  end

  def distance_from(coordinates)
    [(coordinates.x - x).abs, (coordinates.y - y).abs].max
  end
end

