defmodule AdventOfCode.Day13Test do
  use ExUnit.Case

  import AdventOfCode.Day13

  @input """
  6,10
  0,14
  9,10
  0,3
  10,4
  4,11
  6,0
  6,12
  4,1
  0,13
  10,12
  3,4
  3,0
  8,4
  1,10
  2,14
  8,10
  9,0

  fold along y=7
  fold along x=5
  """

  @tag :skip_no
  test "part1" do
    input = @input
    result = part1(input)

    assert result == 17
  end

  @tag :skip_no
  test "part2" do
    input = @input
    result = part2(input)

    assert result == 195
  end
end