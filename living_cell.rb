class LivingCell
  def repopulate(neighbors)
    LivingCell.new if neighbors.count == 2
  end
end
