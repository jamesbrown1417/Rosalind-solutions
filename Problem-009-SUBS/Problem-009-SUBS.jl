#=-----------------------------------------------------------------------------------
# Problem 009 - SUBS 
-----------------------------------------------------------------------------------=#

#=

Given: Two DNA strings s and t (each of length at most 1 kbp).

Return: All locations of t as a substring of s.

=#

###########################
# Sample problem solution #
###########################

# Sample DNA strings
sample_s, sample_t = "GATATATGCATATACTT", "ATAT"

# Create function to find all locations of start of motif t in DNA string s
function find_motif_locations(s::AbstractString, t::AbstractString)
    matches = Int64[]
    for i in 1:(length(s) - length(t))
        if s[i:(i+length(t)) - 1] == t
            push!(matches, i)
        end
    end
    return join(matches, ' ')
end

# Confirm that function works on test case
@assert find_motif_locations(sample_s, sample_t) == "2 4 10"


###########################
#  Real problem solution  #
###########################

# Read in problem DNA strings from .txt file
dna_strings = open("rosalind_subs.txt") do file
    read(file, String)
end

s, t = split(dna_strings, "\n")

# Print solution
find_motif_locations(s, t) |> println