defmodule Aoc.Day1 do
  @numbers %{
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"
  }
  def part1() do
    Aoc.get_file_lines("./input/day1.txt")
    |> Enum.map(fn line ->
      Regex.scan(~r/(\d)/, line, capture: :all_but_first)
      |> List.flatten()
      |> case do
        [n] ->
          String.to_integer("#{n}#{n}")

        l ->
          a = List.first(l)
          b = List.last(l)
          String.to_integer("#{a}#{b}")
      end
    end)
    |> Enum.sum()
  end

  # if there is a substring like twone - it should become 2ne but doing it like this results in tw1. Need to find numbers by iterating over string itself.
  def part2() do
    Aoc.get_file_lines("./input/day1.txt")
    |> Enum.map(fn line ->
      line = replace_words(line) |> IO.inspect()

      Regex.scan(~r/(\d)/, line, capture: :all_but_first)
      |> List.flatten()
      |> case do
        [n] ->
          String.to_integer("#{n}#{n}")

        l ->
          a = List.first(l)
          b = List.last(l)
          String.to_integer("#{a}#{b}")
      end
    end)
    |> Enum.sum()
  end

  defp replace_words(line) do
    Enum.reduce(@numbers, line, fn {key, value}, l ->
      String.replace(l, key, value)
    end)
  end
end
