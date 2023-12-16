
def part_one
    final_score = 0
opponent_ordering = ['A', 'C', 'B']
my_ordering = ['X', 'Z', 'Y']
# rock(1), scissors(3), paper(2)

File.readlines("input.txt").each do |line|
    choices = line.split(" ")

    opponent_choice = choices[0]
    my_choice = choices[1]

    opponent_weight = opponent_ordering.index(opponent_choice)
    my_weight = my_ordering.index(my_choice)

    # compute weight-based score before re-weighting
    if my_weight == 2
        final_score += my_weight
    elsif my_weight == 1
        final_score += (my_weight + 2)
    else
        final_score += (my_weight + 1)
    end

     # re-weight my opponent if we are at extreme edges
     if opponent_weight == 2 && my_weight == 0
        opponent_weight = -1
    end

    # re-weight my weight if we are at extreme edges
    if my_weight == 2 && opponent_weight == 0
        my_weight = -1
    end

    if my_weight < opponent_weight
        final_score += 6
    elsif my_weight == opponent_weight
        final_score += 3
    end

end
final_score
end


def part_two
    win = { 'X' => 'B', 'Z' => 'A', 'Y' => 'C'}
    lose = { 'X' => 'C', 'Z' => 'B', 'Y' => 'A'}
    relation = { 'A' => 'X', 'B' => 'Y', 'C' => 'Z'} # opponent to my choice... we then look up win/lose
    ordering = ['A', 'B', 'C']

    sum = 0

    File.readlines("input.txt").each do |line|
        choices = line.split(" ")

        opponent_choice = choices[0]
        my_choice = choices[1]

        if my_choice == 'X'
            opponent_relation = relation[opponent_choice]
            sum += (ordering.index(lose[opponent_relation]) + 1)
        elsif my_choice == 'Y'
            sum += (ordering.index(opponent_choice) + 1)
            sum += 3 # draw score
        else
            opponent_relation = relation[opponent_choice]
            sum += (ordering.index(win[opponent_relation]) + 1)
            sum += 6 # win score
        end
    end
    sum
end

puts part_two