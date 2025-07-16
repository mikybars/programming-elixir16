defmodule MyString do
  def is_printable(~c""), do: true
  def is_printable([c | tail]) when c in ?\s..?\~, do: is_printable(tail)
  def is_printable(_str), do: false
  def is_printable_nr(str), do: str |> Enum.all?(&(&1 in ?\s..?\~))
end

