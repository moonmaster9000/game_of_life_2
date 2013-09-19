class Game
  attr_reader :living_cells

  def initialize(living_cells: [])
    @living_cells = living_cells
  end

  def tick
    @living_cells = living_cells.map do |living_cell|
      living_cell.reincarnate(neighbors_of(living_cell))
    end.compact
  end

  def neighbors_of(cell)
    neighbors = living_cells.select do |living_cell|
      living_cell != cell && living_cell.distance_from(cell) == 1
    end
  end
end

