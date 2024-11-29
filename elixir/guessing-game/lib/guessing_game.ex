defmodule GuessingGame do
  def compare(secret_number, guess \\ nil)

  def compare(secret_number, guess)
      when is_integer(secret_number) and is_integer(guess) and guess === secret_number,
      do: "Correct"

  def compare(secret_number, guess) when abs(secret_number - guess) == 1, do: "So close"

  def compare(secret_number, guess)
      when is_integer(secret_number) and is_integer(guess) and guess > secret_number,
      do: "Too high"

  def compare(secret_number, guess)
      when is_integer(secret_number) and is_integer(guess) and guess < secret_number,
      do: "Too low"

  def compare(_secret_number, _guess), do: "Make a guess"
end
