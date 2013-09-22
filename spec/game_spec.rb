require_relative '../game'

describe Game do
  describe "#tick" do
    it "repopulates the coordinate system" do
      grid = double :grid
      grid.should_receive(:repopulate)
      game = Game.new(grid: grid)
      game.tick
    end
  end
end
