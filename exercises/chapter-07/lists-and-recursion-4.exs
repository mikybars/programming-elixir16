defmodule MyList do
  def span(from, from), do: [from]

  def span(from, to) when from < to do
    [from | span(from + 1, to)]
  end

  def span(from, to) do
    raise "Can't go from #{from} to #{to}"
  end
end
