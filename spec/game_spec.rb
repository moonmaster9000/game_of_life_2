require_relative '../game'

describe Game do
  describe "#neighbors_of" do
    let(:distance) { nil } 
    let(:living_cell) { double :living_cell }
    let(:another_living_cell) { double :another_living_cell }

    before do 
      living_cell.stub(:distance_from).with(another_living_cell).and_return distance
    end

    context "no living cells"  do
      it "returns an empty array" do
        Game.new.neighbors_of(double(:cell)).should be_empty
      end
    end

    context "living cells a distance of 1 away" do
      let(:distance) { 1 }

      it "returns those cells" do
        game = Game.new(living_cells: [living_cell])
        game.neighbors_of(another_living_cell).should include living_cell
      end
    end

    context "living cells a distance of 2 or more" do
      let(:distance) { 2 }

      it "does not return those cells" do
        game = Game.new(living_cells: [living_cell])
        game.neighbors_of(another_living_cell).should_not include living_cell
      end
    end
  end
end
