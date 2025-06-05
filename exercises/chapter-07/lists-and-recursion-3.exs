defmodule MyList do
  def caesar('', _), do: ''

  def caesar([x | tail], n) do
    [cipher(x, n) | caesar(tail, n)]
    |> List.to_string()
  end

  def cipher(x, n) when x + n > ?z do
    x + n - (?z - ?a + 1)
  end

  def cipher(x, n), do: x + n
end
