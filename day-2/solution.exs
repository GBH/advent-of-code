defmodule Day2 do

  def part1 do
    parsed_data()
    |> Enum.map(&Enum.min_max/1)
    |> Enum.map(fn({min, max}) -> max - min end)
    |> Enum.sum
  end

  def part2 do
    parsed_data()
    |> Enum.map(&get_division/1)
    |> Enum.sum
  end

  defp get_division(row) do
    result =
      for x <- row,
          y <- row,
          x != y,
          rem(x, y) == 0
      do
        div(x, y)
      end
    List.first(result)
  end

  defp parsed_data do
    "#{__DIR__}/input.txt"
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&line_to_row/1)
    |> Enum.map(&cells_to_numbers/1)
  end

  defp line_to_row(line) do
    String.split(line, ~r/\s+/)
  end

  defp cells_to_numbers(row) do
    Enum.map(row, &String.to_integer/1)
  end

end

IO.inspect Day2.part1
# 42378

IO.inspect Day2.part2
# 246
