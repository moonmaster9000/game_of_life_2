require_relative "../cell"

describe Cell do
  describe "equality" do
    context "cells have same coordinates" do
      specify "equal" do
        Cell.new(0,0).should == Cell.new(0,0)
      end
    end

    context "cells have different coordinates" do
      specify "not equal" do
        Cell.new(0,0).should_not == Cell.new(0,1)
      end
    end
  end

  describe "reincarnation" do
    let(:neighbor_finder) { double :neighbor_finder }

    before do
      neighbor_finder.stub(:neighbors_of).and_return neighbors
    end

    context "no neighbors" do
      let(:neighbors) { [] }

      it "returns nil" do
        cell = Cell.new(0,0)
        cell.reincarnate(neighbor_finder).should be_nil
      end
    end

    context "one neighbor" do
      let(:neighbors) { [double(:cell)] }

      it "returns nil" do
        cell = Cell.new(0,0)
        cell.reincarnate(neighbor_finder).should be_nil
      end
    end

    context "two neighbors" do
      let(:neighbors) { [double(:cell), double(:cell)] }

      it "returns a copy of itself" do
        cell = Cell.new(0,0)
        cell.reincarnate(neighbor_finder).should == Cell.new(0,0)
      end
    end
  end
end