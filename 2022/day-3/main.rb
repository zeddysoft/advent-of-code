
def part_one
    sum = 0
    File.readlines("input1.txt").each do |line|
        middle_index = line.length / 2
        first_group = line.slice(0, middle_index)
        second_group = line.slice(middle_index..-1)
    
    
        first_group.each_char do |ch|
            if second_group.include?(ch)
                if (ch == ch.downcase)
                    sum += (ch.ord - 96)
                elsif
                    sum += (ch.ord-38)
                end
                break
            end
        end
    end
    puts sum
end

def part_two
    sum = 0
    group = []
    File.readlines("input_1.txt").each_with_index do |line, index|
        line = line.chomp

        if ((index + 1) % 3 == 0 )
            group << line
            common_char = ''
            group.first.each_char do |ch| 
                if group.all? { |element| element.include?(ch) }
                    common_char = ch
                end
            end

            if (common_char == common_char.downcase)
                sum += (common_char.ord - 96)
            else
                sum += (common_char.ord-38)
            end

            group.clear
        else
            group << line
        end
    end

    puts sum
end

part_two

