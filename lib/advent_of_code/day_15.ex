defmodule AdventOfCode.Day15 do
  @neighbours [{1, 0}, {0, 1}, {-1, 0}, {0, -1}]

  def part1(args) do
    grid_str =
      args
      |> String.split("\n", trim: true)
      |> Enum.map(fn line -> String.split(line, "", trim: true) end)

    #      |> IO.inspect(label: "7")

    height = Enum.count(grid_str)
    width = Enum.count(Enum.at(grid_str, 0))

    grid =
      for y <- 0..(height - 1),
          x <- 0..(width - 1),
          into: %{},
          do: {{x, y}, grid_str |> Enum.at(y) |> Enum.at(x) |> String.to_integer()}

    target = {width - 1, height - 1}

    find_costs(%{{0, 0} => 0}, MapSet.new([{0, 0}]), grid, target)
  end

  defp find_costs(costs, burned, grid, target) do
    Enum.count(burned) |> IO.inspect(label: "27")

    if Map.keys(grid) |> Enum.all?(fn elt -> MapSet.member?(burned, elt) end) do
      Map.get(costs, target)
    else
      {{x, y}, v} =
        costs
        |> Enum.filter(fn {k, _v} -> not MapSet.member?(burned, k) end)
        |> Enum.min_by(fn {_k, v} -> v end, fn -> {{0, 0}, 0} end)

      @neighbours
      |> Enum.map(fn {dx, dy} -> {x + dx, y + dy} end)
      |> Enum.filter(fn k -> Map.has_key?(grid, k) end)
      |> Enum.reduce(costs, fn elt, acc ->
        cost_neighbour = Map.get(grid, elt)

        case Map.get(acc, elt) do
          nil ->
            Map.put(acc, elt, v + cost_neighbour)

          val ->
            new_v = Enum.min([v + cost_neighbour, val])
            Map.put(acc, elt, new_v)
        end
      end)
      |> find_costs(MapSet.put(burned, {x, y}), grid, target)
    end
  end

  def part2(args) do
  end
end
