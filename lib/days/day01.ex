defmodule Day01 do
  def ship_fuel_requirement(input) do
    input
    |> String.trim()
    |> String.split()
    |> Stream.map(&String.to_integer/1)
    |> Stream.map(&fuel_requirement/1)
    |> Stream.map(&fuel_gross_up/1)      # This line and function implement Part 2
    |> Enum.sum
  end

  defp fuel_requirement(mass), do: div(mass, 3) - 2

  defp fuel_gross_up(mass), do: fuel_gross_up(mass, mass)

  defp fuel_gross_up(0, acc), do: acc
  defp fuel_gross_up(mass, acc) do
    requirement = max(0, fuel_requirement(mass))
    fuel_gross_up(requirement, acc + requirement)
  end
end
