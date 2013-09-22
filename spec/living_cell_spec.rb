require_relative "../coordinate"
require_relative "../living_cell"

describe LivingCell do
  describe "repopulation" do
    context "no neighbors" do
      let(:neighbors) { [] }

      it "returns nil" do
        cell = LivingCell.new
        cell.repopulate(neighbors).should be_nil
      end
    end

    context "one neighbor" do
      let(:neighbors) { [double(:cell)] }

      it "returns nil" do
        cell = LivingCell.new
        cell.repopulate(neighbors).should be_nil
      end
    end

    context "two neighbors" do
      let(:neighbors) { [double(:cell), double(:cell)] }

      it "returns a copy of itself" do
        cell = LivingCell.new
        cell.repopulate(neighbors).should be_a(LivingCell)
      end
    end
  end
end
