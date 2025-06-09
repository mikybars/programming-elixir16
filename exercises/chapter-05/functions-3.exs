fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end

fb = fn n -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

IO.puts([fb.(10), fb.(11), fb.(12), fb.(13), fb.(14), fb.(15), fb.(16)])
