defmodule Codetest.Command do


  def push(list, element) do
    [list | element]
  end

  def pop(list) do
    [Enum.at(list, -1)]
  end

  def checksum(list) do
    indexes = for index <- (0..length(list) - 1) do
      index end

      even_indexes = Enum.drop_every(indexes, 2)

      even_digits = for x <- even_indexes do
        Enum.at(list,x) end

      odd_digits = list -- even_digits

      odd_digits_sum = Enum.sum(odd_digits)
      even_digits_sum = Enum.sum(even_digits)

      odd_digits_sum =  odd_digits_sum * 3


      total = odd_digits_sum + even_digits_sum

        if rem(total, 10)== 0 do
          0
        else
          10 - rem(total, 10)
        end

  end

end
