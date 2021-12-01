defmodule AdventOfCode.Day01 do
  def part1(args) do
    {_, res} =
      args
      |> String.split()
      |> Enum.map(fn i -> String.to_integer(i) end)
      |> Enum.reduce({-1, 0}, fn i, {curr, nb} ->
        if curr != -1 and i > curr do
          {i, nb + 1}
        else
          {i, nb}
        end
      end)

    res
  end

  def part2(args) do
    [a | [b | list]] =
      args
      |> String.split()
      |> Enum.map(fn i -> String.to_integer(i) end)

    {_, res} =
      Enum.zip([list, [b | list], [a | [b | list]]])
      |> Enum.reduce({-1, 0}, fn {a, b, c}, {curr, nb} ->
        if curr != -1 and a + b + c > curr do
          {a + b + c, nb + 1}
        else
          {a + b + c, nb}
        end
      end)

    res
  end
end
