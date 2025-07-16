defmodule MyString do
  def calculate(expr) do
    case Regex.run(~r/(\d+)\s*([\+\-\*\/])\s*(\d+)/, to_string(expr)) do
      [_, num1, op, num2] -> apply(op).(String.to_integer(num1), String.to_integer(num2))
      _ -> "Invalid expression #{expr}"
    end
  end

  defp apply(op) when op == "+", do: &(&1 + &2)
  defp apply(op) when op == "-", do: &(&1 - &2)
  defp apply(op) when op == "*", do: &(&1 * &2)
  defp apply(op) when op == "/", do: &(&1 / &2)
  defp apply(other), do: raise("Unknown op #{other}")
end
