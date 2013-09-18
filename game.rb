class Game
  attr_reader :living_cells

  def initialize(living_cells: [])
    @living_cells = living_cells
  end

  def tick
    @living_cells = living_cells.map do |living_cell|
      living_cell.reincarnate(self)
    end.compact
  end

  def neighbors_of(cell)
    neighbors = living_cells.select do |living_cell|
      living_cell != cell && (living_cell.x - cell.x).abs <= 1 && (living_cell.y - cell.y).abs <= 1
    end
  end
end

