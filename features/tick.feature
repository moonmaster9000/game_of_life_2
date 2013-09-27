Feature: Tick

  Scenario: Cells with no neighbors
    Given a grid with living cells with no living neighbors
    When the clock ticks
    Then the grid should have no living cells

  Scenario: Cells with two neighbors
    Given a grid with living cells that have two neighbors
    When the clock ticks
    Then those living cells should continue to live

  Scenario: Dead cells with exactly 3 neighbors
    Given a grid with a dead cell with exactly three live neighbors
    When the clock ticks
    Then that dead cell should come to life like a zombie
