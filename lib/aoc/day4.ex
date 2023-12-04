defmodule Aoc.Day4 do

  def part1() do
    Aoc.get_file_lines("./input/day4.txt")
    |> Enum.map(fn line ->
      [winning, current] = String.split(line, " | ")
      winning = String.split(winning, ": ") |> List.last() |> String.split()
      current = String.split(current)

      original_length = length(current)
      win_count = length(current -- winning)

      difference = original_length - win_count

      if difference == 0 do
        0
      else
        Integer.pow(2, difference-1)
      end
    end)
    |> Enum.sum()
  end
end
