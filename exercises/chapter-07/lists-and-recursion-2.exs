defmodule MyList do
  def max([x]), do: x

  def max([head | tail]) do
    max2(head, max(tail))
  end

  def max2(a, b) when a > b, do: a
  def max2(_a, b), do: b
end
