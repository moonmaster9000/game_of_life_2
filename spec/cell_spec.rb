require_relative "../coordinates"
require_relative "../cell"

describe Cell do
  describe "equality" do
    context "cells have same coordinates" do
      specify "equal" do
        Cell.new(Coordinates.new(0,0)).should == Cell.new(Coordinates.new(0,0))
      end
    end

    context "cells have different coordinates" do
      specify "not equal" do
        Cell.new(Coordinates.new(0,0)).should_not == Cell.new(Coordinates.new(0,1))
      end
    end
  end

  describe "reincarnation" do
    context "no neighbors" do
      let(:neighbors) { [] }

      it "returns nil" do
        cell = Cell.new(Coordinates.new(0,0))
        cell.reincarnate(neighbors).should be_nil
      end
    end

    context "one neighbor" do
      let(:neighbors) { [double(:cell)] }

      it "returns nil" do
        cell = Cell.new(Coordinates.new(0,0))
        cell.reincarnate(neighbors).should be_nil
      end
    end

    context "two neighbors" do
      let(:neighbors) { [double(:cell), double(:cell)] }

      it "returns a copy of itself" do
        cell = Cell.new(Coordinates.new(0,0))
        cell.reincarnate(neighbors).should == Cell.new(Coordinates.new(0,0))
      end
    end
  end
end
