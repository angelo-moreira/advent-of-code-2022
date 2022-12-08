defmodule D2Test do
  @moduledoc false
  use ExUnit.Case
  import D2, only: [part1: 1]

  @tag :d2_p1
  test "should produce correct day1 part 1 correct output" do
    assert part1("#{__DIR__}/d2_input.txt") == 15
  end
end
