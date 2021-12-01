defmodule AdventOfCode.Day01 do
  def part1(args) do
    {_, res} =
      args
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> Enum.reduce({-1, 0}, fn i, {curr, nb} ->
        if is_lower(curr, i), do: {i, nb + 1}, else: {i, nb}
      end)

    res
  end

  def part2(args) do
    [a, b | list] = args |> String.split() |> Enum.map(&String.to_integer/1)

    {_, res} =
      Enum.zip([list, [b | list], [a, b | list]])
      |> Enum.map(fn {a, b, c} -> a + b + c end)
      |> Enum.reduce({-1, 0}, fn i, {curr, nb} ->
        if is_lower(curr, i), do: {i, nb + 1}, else: {i, nb}
      end)

    res
  end

  defp is_lower(-1, _), do: false
  defp is_lower(curr, i) when i > curr, do: true
  defp is_lower(_, _), do: false
end
