defmodule Day4 do

  def part1 do
    lines()
    |> Enum.filter(fn(l) -> length(Enum.uniq(l)) == length(l) end)
    |> length()
  end

  def part2 do
    lines()
    |> Enum.map(&sort_words/1)
    |> Enum.filter(fn(l) -> length(Enum.uniq(l)) == length(l) end)
    |> length()
  end

  defp sort_words(words) do
    words
    |> Enum.map(&sort_word/1)
  end

  defp sort_word(word) do
    word
    |> String.codepoints()
    |> Enum.sort()
    |> Enum.join()
  end

  defp lines do
    "#{__DIR__}/input.txt"
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn(l) -> String.split(l, ~r/\s+/) end)
  end

end

IO.inspect Day4.part1
# 325

IO.inspect Day4.part2
# 119