#=-----------------------------------------------------------------------------------
# Problem 004 - FIB 
-----------------------------------------------------------------------------------=#

#=

Given: Positive integers n <= 40 and k <= 5. 

Return: The total number of rabbit pairs that will be present after n months,
if we begin with 1 pair and in each generation, every pair of reproduction-age rabbits
produces a litter of k rabbit pairs.

=#

###########################
# Sample problem solution #
###########################

# Create function to get nth value in generalised Fibonacci sequence
function fib(n::Int64, k::Int64)
    starting_sequence = [1, 1]
    for i in 1:(n-2)
        new_value = starting_sequence[end] + (k * starting_sequence[end - 1])
        push!(starting_sequence, new_value)
    end
    return pop!(starting_sequence)
end

# Confirm that function gives correct result on sample problem
@assert fib(5, 3) == 19

###########################
#  Real problem solution  #
###########################

# Read in problem DNA string from .txt file
dna_string_problem = open("rosalind_fib.txt") do file
    read(file, String)
end

# Get n and k values for problem from txt file
n,k = 29,3

# Print answer
println(fib(n, k))
