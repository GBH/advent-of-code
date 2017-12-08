defmodule Day5 do

  def part1 do
    jump(list(), 0, 0)
  end

  def part2 do
    jump2(list(), 0, 0)
  end

  defp jump(list, position, count) when position >= 0 and position < length(list) do
    move_count = Enum.at(list, position)
    new_list = List.replace_at(list, position, move_count + 1)
    jump(new_list, position + move_count, count + 1)
  end

  defp jump(_, _, count) do
    count
  end

  defp jump2(list, position, count) when position >= 0 and position < length(list) do
    move_count = Enum.at(list, position)
    new_value = if move_count >= 3 do -1 else 1 end
    new_list = List.replace_at(list, position, move_count + new_value)
    jump2(new_list, position + move_count, count + 1)
  end

  defp jump2(_, _, count) do
    count
  end

  defp list do
    "#{__DIR__}/input.txt"
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn(n) -> String.to_integer(n) end)
  end
end

IO.inspect Day5.part1()
# 374269

IO.inspect Day5.part2()
# 27720699