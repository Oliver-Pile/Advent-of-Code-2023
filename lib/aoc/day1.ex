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

  # Working on dummy data. From some research on discord, looks like 'eightwothree' should be passed as 823. Currently it is 8wo3
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
    num_words = Regex.scan(~r/(one|two|three|four|five|six|seven|eight|nine)/, line, capture: :all_but_first) |> List.flatten()
    Enum.reduce(num_words, line, fn word, l ->
      String.replace(l, word, Map.get(@numbers, word))
    end)
  end
end
