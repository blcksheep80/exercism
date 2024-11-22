defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(minutes_passed),
    do: Kernel.-(expected_minutes_in_oven(), minutes_passed)

  def preparation_time_in_minutes(layers), do: Kernel.*(layers, 2)

  def total_time_in_minutes(layers, minutes_remaining),
    do: Kernel.+(preparation_time_in_minutes(layers), minutes_remaining)

  def alarm(), do: "Ding!"
end
