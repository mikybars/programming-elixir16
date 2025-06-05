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

tax_rates = [NC: 0.075, TX: 0.08]

orders = [
  [id: 123, ship_to: :NC, net_amount: 100.00],
  [id: 124, ship_to: :OK, net_amount: 35.50],
  [id: 125, ship_to: :TX, net_amount: 24.00],
  [id: 126, ship_to: :TX, net_amount: 44.80],
  [id: 127, ship_to: :NC, net_amount: 25.00],
  [id: 128, ship_to: :MA, net_amount: 10.00],
  [id: 129, ship_to: :CA, net_amount: 102.00],
  [id: 130, ship_to: :NC, net_amount: 50.00]
]

IO.inspect(Tax.orders_with_total(orders, tax_rates))
