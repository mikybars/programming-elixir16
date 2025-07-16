defmodule Tax do
  def orders_with_total(orders, taxes) do
    orders |> Enum.map(&_apply_tax(&1, taxes))
  end

  defp _apply_tax(order = [id: _, ship_to: ship_to, net_amount: net_amount], taxes) do
    order ++ [total_amount: net_amount + _tax_for(net_amount, taxes[ship_to])]
  end

  defp _tax_for(_, tax) when is_nil(tax), do: 0
  defp _tax_for(net_amount, tax), do: net_amount * tax
end

defmodule Csv do
  def read(filename) do
    with {:ok, file} = File.open(filename),
         csv = IO.stream(file, :line) do
      _combine(
        _read_col_names_from(csv),
        _read_rows_from(csv)
      )
    end
  end

  defp _read_col_names_from(csv) do
    csv |> Enum.at(0) |> _parse()
  end

  defp _parse(line, default_mapper \\ &String.to_atom/1) do
    _columns_from(line) |> Enum.map(&_map_value(&1, default_mapper))
  end

  defp _read_rows_from(csv) do
    Enum.map(csv, &_parse(&1))
  end

  defp _columns_from(line) do
    line
    |> String.trim_trailing("\n")
    |> then(&Regex.split(~r/,\s*/, &1))
  end

  defp _map_value(value, default_mapper) do
    case value do
      <<?:, str::binary>> ->
        String.to_atom(str)

      _ ->
        cond do
          Regex.match?(~r/\d+\.\d+/, value) -> String.to_float(value)
          Regex.match?(~r/\d+/, value) -> String.to_integer(value)
          true -> default_mapper.(value)
        end
    end
  end

  defp _combine(col_names, rows) do
    rows |> Enum.map(&Enum.zip(col_names, &1))
  end
end

tax_rates = [NC: 0.075, TX: 0.08]

Csv.read("exercises/chapter-11/orders.csv") |> Tax.orders_with_total(tax_rates) |> IO.inspect()
