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
    Aoc.get_file_lines("./input/day4.txt")
    |> Enum.reduce(%{}, fn line, total_cards ->
      current_card = Regex.scan(~r/Card\s*(\d+)/, line, capture: :all_but_first) |> List.to_string() |> String.to_integer()

      total_cards = Map.update(total_cards, current_card, 1, fn existing -> existing + 1 end)

      current_card_count = Map.get(total_cards, current_card, 1)

      matches = count_of_matches(line)

      if matches != 0 do
        Enum.reduce(current_card+1..current_card+matches, total_cards, fn v, acc ->
          Map.update(acc, v, current_card_count, fn existing -> existing + current_card_count end)
        end)
      else
        total_cards
      end
    end)
    |> Map.values()
    |> Enum.sum()
  end
end
