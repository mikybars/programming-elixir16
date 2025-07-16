defmodule MyString do
  def print_aligned([]), do: :ok

  def print_aligned(list) do
    longest = list |> Enum.max_by(&String.length/1) |> String.length()
    Enum.each(list, &_print_centered(&1, longest))
  end

  defp _print_centered(str, line_len) do
    totalp = line_len - String.length(str)
    leftp = div(totalp, 2)

    str
    |> String.pad_leading(String.length(str) + leftp)
    |> String.pad_trailing(line_len)
    |> IO.puts()
  end
end

MyString.print_aligned(~w{ cat zebra elephant })
