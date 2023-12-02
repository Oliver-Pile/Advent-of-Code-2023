defmodule Aoc do
  @moduledoc """
  Documentation for `Aoc`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Aoc.hello()
      :world

  """
  def hello do
    :world
  end

  def get_file_lines(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end
end
