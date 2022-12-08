defmodule D1Test do
  @moduledoc false
  use ExUnit.Case
  import D1, only: [part1: 1]

  @tag :d1_p1
  test "should produce correct day1 part 1 correct output" do
    assert part1("#{__DIR__}/d1_input.txt") == 24_000
  end
end