Feature: Tick

  Scenario: Cells with no neighbors
    Given a grid with living cells with no living neighbors
    When the clock ticks
    Then the grid should have no living cells
