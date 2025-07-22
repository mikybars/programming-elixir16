defmodule FizzBuzz do
  def fb(n) do
    case {rem(n, 3), rem(n, 5), n} do
      {0, 0, _} -> "FizzBuzz"
      {0, _, _} -> "Fizz"
      {_, 0, _} -> "Buzz"
      {_, _, c} -> c
    end
  end
end

fb = &FizzBuzz.fb/1

1..20
|> Enum.map(&"#{&1} -> #{fb.(&1)}")
|> Enum.each(&IO.puts/1)
