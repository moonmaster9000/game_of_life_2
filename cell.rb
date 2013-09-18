class Cell
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def reincarnate(neighbor_finder)
    Cell.new x, y if neighbor_finder.neighbors_of(self).count == 2
  end

  def ==(cell)
    x == cell.x && y == cell.y
  end
end
