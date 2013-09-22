require_relative "../grid"

describe Grid do
  describe "#repopulate" do
    it "returns a new coordinate system containing any coordinates that aren't empty after repopulation" do
      coordinate = double(:coordinate)
      grid = Grid.new coordinates: [coordinate]
      coordinate.should_receive(:repopulate).with(grid).and_return nil
      grid.repopulate
      grid.coordinates.should be_empty
    end
  end

  describe "#neighbors_of" do
    let(:existing_coordinate) { double :existing_coordinate }
    let(:new_coordinate) { double :new_coordinate }

    context "no coordinates a distance of 1 away" do
      before do
        existing_coordinate.stub(:distance_from).with(new_coordinate).and_return 2
      end

      it "returns an empty array" do
        grid = Grid.new(coordinates: [existing_coordinate])
        grid.neighbors_of(new_coordinate).should be_empty
      end
    end

    context "existing coordinate distance of 1 away" do
      before do
        existing_coordinate.stub(:distance_from).with(new_coordinate).and_return 1
      end

      it "returns an array containing the existing coordinate" do
        grid = Grid.new(coordinates: [existing_coordinate])
        grid.neighbors_of(new_coordinate).should include existing_coordinate
      end
    end
  end
end
