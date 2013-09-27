require_relative "../dead_cell"

describe DeadCell do
  describe "#repopulate" do
    context "three neighbors" do
      it "constructs a live cell" do
        live_cell_factory = double(:live_cell_factory)
        live_cell_factory.should_receive(:new)

        DeadCell.new(live_cell_factory: live_cell_factory).repopulate(
          [
            double(:neighbor1),
            double(:neighbor2),
            double(:neighbor3)
          ]
        )
      end
    end

    context "two or fewer neighbors" do
      it "returns nil" do
        DeadCell.new(live_cell_factory: double(:live_cell_factory)).repopulate([]).should be_nil
      end
    end
  end
end
