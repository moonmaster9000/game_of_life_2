class LivingCell
  def repopulate(neighbors)
    LivingCell.new if neighbors.count == 2 || neighbors.count == 3
  end
end
