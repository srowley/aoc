defmodule Day01 do
  def ship_fuel_requirement(input) do
    input
    |> String.trim()
    |> String.split()
    |> Stream.map(&String.to_integer/1)
    |> Stream.map(&module_fuel_requirement/1)
    |> Enum.sum
  end

  defp module_fuel_requirement(module_mass) do
    div(module_mass, 3) - 2
  end
end
