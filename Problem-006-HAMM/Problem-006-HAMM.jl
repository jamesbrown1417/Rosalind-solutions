#=-----------------------------------------------------------------------------------
# Problem 006 - HAMM 
-----------------------------------------------------------------------------------=#

#=

Given: Two DNA strings s and t of equal length (not exceeding 1 kbp).

Return: The Hamming distance dH(s,t).

=#

###########################
# Sample problem solution #
###########################

# Get two sample strings
sample_s = "GAGCCTACTAACGGGAT"
sample_t = "CATCGTAATGACGGCCT"

# Create function to get Hamming distance
function dH(s, t)
    hamming_distance = 0
    for (string_1, string_2) in zip(s, t)
        if string_1 != string_2
            hamming_distance += 1
        else
            continue
        end
    end
    return hamming_distance
end

# Confirm that function gives correct answer for sample problem
@assert dH(sample_s, sample_t) == 7

###########################
#  Real problem solution  #
###########################

# Read in problem DNA strings from .txt file
problem_string = open("rosalind_hamm.txt") do file
    read(file, String)
end

s,t = split(problem_string, "\n")

# Print solution
println(dH(s, t))

