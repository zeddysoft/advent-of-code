
calorie_sum = []
sum = 0
File.readlines("input.txt").each do |line| 
    if line.strip.empty?
        calorie_sum << sum
        sum = 0
    else
        sum += line.to_i
    end
end
calorie_sum << sum

calorie_sum.sort! {|a,b| b <=> a}
top_three = calorie_sum.take(3)
puts top_three.sum