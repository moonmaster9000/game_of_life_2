class DeadCell
  def initialize(live_cell_factory: LivingCell)
    @live_cell_factory = live_cell_factory
  end

  def repopulate(neighbors)
    live_cell_factory.new if neighbors.count == 3
  end

  private
  attr_reader :live_cell_factory
end
