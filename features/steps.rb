class Game
  def initialize(*)
  end

  def tick
  end

  def living_cells
    []
  end
end

class Cell
  def initialize(x, y)
  end
end

Given(/^a grid with living cells with no living neighbors$/) do
  @game = Game.new(living_cells: [Cell.new(0,0), Cell.new(10,10)])
end

When(/^the clock ticks$/) do
  @game.tick
end

Then(/^the grid should have no living cells$/) do
  @game.living_cells.should == []
end
