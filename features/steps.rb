require_relative '../game'
require_relative '../cell'

Given(/^a grid with living cells with no living neighbors$/) do
  @game = Game.new(living_cells: [Cell.new(0,0), Cell.new(10,10)])
end

When(/^the clock ticks$/) do
  @game.tick
end

Then(/^the grid should have no living cells$/) do
  @game.living_cells.should == []
end

Given(/^a grid with living cells that have two neighbors$/) do
  @game = Game.new(
    living_cells: [
      Cell.new(0,1),
      Cell.new(0,0), Cell.new(1, 0)
    ]
  )
end

Then(/^those living cells should continue to live$/) do
  @game.living_cells.should include(
    Cell.new(0,1),
    Cell.new(0,0), Cell.new(1, 0)
  )
end
