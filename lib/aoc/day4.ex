defmodule Aoc.Day4 do

  def part1() do
    Aoc.get_file_lines("./input/day4.txt")
    |> Enum.map(fn line ->


      matches = count_of_matches(line)
      if matches == 0 do
        0
      else
        Integer.pow(2, matches-1)
      end
    end)
    |> Enum.sum()
  end

  defp count_of_matches(line) do
    [winning, current] = String.split(line, " | ")
    winning = String.split(winning, ": ") |> List.last() |> String.split()
    current = String.split(current)

    original_length = length(current)
    win_count = length(current -- winning)

    original_length - win_count
  end

  def part2() do
    total_cards = %{}
    Aoc.get_file_lines("./input/day4.txt")
    |> Enum.reduce(total_cards, fn line, acc ->
      current_card = Regex.scan(~r/Card\s*(\d+)/, line, capture: :all_but_first) |> List.to_string() |> String.to_integer()

      acc = Map.update(acc, current_card, 1, fn existing -> existing + 1 end)

      current_card_count = Map.get(acc, current_card, 1)

      matches = count_of_matches(line)

      if matches != 0 do
        Enum.reduce(current_card+1..current_card+matches, acc, fn v, acc1 ->
          Map.update(acc1, v, current_card_count, fn existing -> existing + current_card_count end)
        end)
      else
        acc
      end
    end)
    |> Map.values()
    |> Enum.sum()
  end
end
