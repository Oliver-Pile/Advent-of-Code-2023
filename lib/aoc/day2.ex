defmodule Aoc.Day2 do

  def part1() do
    Aoc.get_file_lines("./input/day2.txt")
    |> Enum.map(fn line ->
      day = Regex.scan(~r/Game (\d+)/, line, capture: :all_but_first) |> List.to_string()
      green = find_all_occurances_for_color("green", line)
      red = find_all_occurances_for_color("red", line)
      blue = find_all_occurances_for_color("blue", line)
      %{day: day, red: red, green: green, blue: blue}
    end)
    |> Enum.reject(fn %{red: r, green: g, blue: b} ->
      Enum.any?(r, & &1 > 12) or Enum.any?(g, & &1 > 13) or Enum.any?(b, & &1 > 14)
    end)
    |> Enum.map(fn %{day: d} -> String.to_integer(d) end)
    |> Enum.sum()
  end

  def part2() do
    Aoc.get_file_lines("./input/test.txt")
    |> Enum.map(fn line ->
      green = find_all_occurances_for_color("green", line) |> Enum.max()
      red = find_all_occurances_for_color("red", line) |> Enum.max()
      blue = find_all_occurances_for_color("blue", line) |> Enum.max()
      green * red * blue
    end)
    |> Enum.sum()
  end

  defp find_all_occurances_for_color(color, line) do
    Regex.scan(~r/(\d+)\s#{color}/, line, capture: :all_but_first)
    |> List.flatten()
    |> Enum.map(&String.to_integer/1)
  end

end
