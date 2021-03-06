require_relative "../coordinate"

describe Coordinate do
  describe "#neighboring_positions" do
    it "returns all the positions a distance of 1 from itself" do
      Coordinate.new(position: [0,0], contents: double(:contents)).neighboring_positions.should =~ [
        [-1,1], [0,1], [1,1],
        [-1,0],        [1,0],
        [-1,-1],[0,-1],[1,-1]
      ]
    end
  end

  describe "#distance_from" do
    it "returns the greater of the absolute distance on the x or y axis" do
      Coordinate.new(position: [1,3], contents: double(:contents)).distance_from(
        Coordinate.new(position: [0,1], contents: double(:contents))
      ).should == 2
    end
  end

  describe "#repopulate" do
    let(:neighbor_finder) { double :neighbor_finder, neighbors_of: neighbors_of_coordinate }
    let(:neighbors_of_coordinate) { [double(:neighbor)] }
    let(:contents) { [double(:contents)] }
    let(:new_contents) { double :new_contents }

    context "when the contents do not repopulate successfully" do
      before do
        contents.stub(:repopulate).with(neighbors_of_coordinate).and_return nil
      end

      specify "then return nil" do
        Coordinate.new(position: double(:position), contents: contents).repopulate(neighbor_finder).should be_nil
      end
    end

    context "when the contents repopulate successfully" do
      before do
        contents.stub(:repopulate).with(neighbors_of_coordinate).and_return new_contents
      end

      specify "then return a coordinate containing the new contents" do
        position = double(:position)
        coordinate = Coordinate.new(position: position, contents: contents)
        new_coordinate = coordinate.repopulate(neighbor_finder)
        new_coordinate.contents.should == new_contents
      end

      specify "and return a coordinate containing the same position" do
        position = double(:position)
        coordinate = Coordinate.new(position: position, contents: contents)
        new_coordinate = coordinate.repopulate(neighbor_finder)
        new_coordinate.position.should == position
      end
    end
  end
end
