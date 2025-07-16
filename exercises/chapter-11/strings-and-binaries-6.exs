defmodule MyString do
  def capitalize_sentences(str) do
    str
    |> String.split(~r/\.\s+/)
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(". ")
  end
end

IO.puts(MyString.capitalize_sentences("oh. a DOG. woof. "))
