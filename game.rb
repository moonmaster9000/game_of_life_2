class Game
  attr_reader :grid

  def initialize(grid: Grid.new)
    @grid = grid
  end

  def tick
    grid.repopulate
  end
end
