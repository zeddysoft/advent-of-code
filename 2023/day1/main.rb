final_sum = 0
File.readlines("input.txt").each do |line| 
    digits = line.scan(/\d/)
    first_digit = (digits.first || "0")
    last_digit = (digits.last || first_digit)

    final_sum += (first_digit + last_digit).to_i
end
p final_sum