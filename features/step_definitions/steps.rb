require_relative '../../game'
require_relative '../../grid'
require_relative '../../living_cell'
require_relative "../../dead_cell"
require_relative "../../coordinate"

Given(/^a grid with living cells with no living neighbors$/) do
  @game = Game.new(
    grid: Grid.new(coordinates: [
      Coordinate.new(position: [0,0],   contents: LivingCell.new),
      Coordinate.new(position: [10,10], contents: LivingCell.new)
    ])
  )
end

When(/^the clock ticks$/) do
  @game.tick
end

Then(/^the grid should have no living cells$/) do
  @game.grid.coordinates.should == []
end

Given(/^a grid with living cells that have two neighbors$/) do
  @game = Game.new(
    grid: Grid.new(coordinates: [
      Coordinate.new(position: [0,1], contents: LivingCell.new),
      Coordinate.new(position: [0,0], contents: LivingCell.new), Coordinate.new(position: [1,0], contents: LivingCell.new)
    ])
  )
end

Then(/^those living cells should continue to live$/) do
  @game.grid.coordinates.should include(
    Coordinate.new(position: [0,1], contents: LivingCell.new),
    Coordinate.new(position: [0,0], contents: LivingCell.new), Coordinate.new(position: [1,0], contents: LivingCell.new)
  )
end

Given(/^a grid with a dead cell with exactly three live neighbors$/) do
  @game = Game.new(
    grid: Grid.new(coordinates: [
      Coordinate.new(position: [0,1], contents: LivingCell.new),
      Coordinate.new(position: [0,0], contents: LivingCell.new), Coordinate.new(position: [1,0], contents: LivingCell.new)
    ])
  )
end

Then(/^that dead cell should come to life like a zombie$/) do
  @game.grid.coordinates.should include(
    Coordinate.new(position: [0,1], contents: LivingCell.new), Coordinate.new(position: [1,1], contents: LivingCell.new),
    Coordinate.new(position: [0,0], contents: LivingCell.new), Coordinate.new(position: [1,0], contents: LivingCell.new)
  )
end
