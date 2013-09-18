require_relative '../game'

describe Game do
  describe "#neighbors_of" do
    context "no living cells"  do
      it "returns an empty array" do
        Game.new.neighbors_of(Cell.new(0,0)).should be_empty
      end
    end

    context "living cells a distance of 1 away" do
      it "returns those cells" do
        game = Game.new(living_cells: [Cell.new(0,0)])
        game.neighbors_of(Cell.new(0,1)).should include Cell.new(0,0)
      end
    end

    context "living cells a distance of 2 or more" do
      it "does not return those cells" do
        game = Game.new(living_cells: [Cell.new(0,0), Cell.new(1,0)])
        neighbors = game.neighbors_of(Cell.new(2,0))
        neighbors.should_not include Cell.new(0,0)
        neighbors.should include Cell.new(1,0)
      end
    end
  end
end
