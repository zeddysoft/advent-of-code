
def part_one
    sum = 0
    File.readlines("input_1.txt").each do |line|
        line = line.chomp
        first_pair, second_pair = line.split(",")
        a1, b1 = first_pair.split("-").map(&:to_i)

        a2, b2 = second_pair.split("-").map(&:to_i)

        if (a2 >= a1 && b2 <= b1) || (a1 >= a2 && b1 <= b2)
            sum += 1
        end
    end

    puts sum
end

part_one