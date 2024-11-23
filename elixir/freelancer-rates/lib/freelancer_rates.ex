defmodule FreelancerRates do
  @spec daily_rate(number()) :: float()
  def daily_rate(hourly_rate) do
    Kernel.*(hourly_rate, 8.0)
  end

  @spec apply_discount(number(), number()) :: float()
  def apply_discount(original_price, discount) do
    discount = Kernel./(discount, 100)
    percentage_remaining = Kernel.-(1, discount)

    Kernel.*(original_price, percentage_remaining)
  end

  @spec monthly_rate(number(), number()) :: integer()
  def monthly_rate(hourly_rate, discount) do
    discount = Kernel.*(discount, 1.0)

    hourly_rate
    |> Kernel.*(1.0)
    |> daily_rate()
    |> apply_discount(discount)
    |> Kernel.*(22)
    |> Kernel.ceil()
  end

  @spec days_in_budget(number(), number(), number()) :: float()
  def days_in_budget(budget, hourly_rate, discount) do
    budget = Kernel.*(budget, 1.0)
    discount = Kernel.*(discount, 1.0)

    daily_rate =
      hourly_rate
      |> daily_rate()
      |> apply_discount(discount)

    Kernel./(budget, daily_rate)
    |> Float.floor(1)
  end
end
