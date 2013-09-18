require_relative "../coordinates"

describe Coordinates do
  describe "#distance_from" do
    it "returns the greater of the absolute distance on the x or y axis" do
      Coordinates.new(0,1).distance_from(Coordinates.new(1,3)).should == 2
    end
  end
end

