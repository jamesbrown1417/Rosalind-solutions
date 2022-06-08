#=-----------------------------------------------------------------------------------
# Problem 001 - DNA
-----------------------------------------------------------------------------------=#

#=

Given: A DNA string s of length at most 1000 nt.

Return: Four integers (separated by spaces) counting
the respective number of times that the symbols 'A', 'C', 'G', and 'T' occur in s.

=#

###########################
# Sample problem solution #
###########################

# Load Stats Packages
using StatsKit

# Read in sample DNA string
dna_string_sample = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

# Get counts of each nucleotide in a dict
nucleotide_counts_sample = countmap(dna_string_sample)

# Print Sample answer
println("$(nucleotide_counts_sample['A']) $(nucleotide_counts_sample['C']) $(nucleotide_counts_sample['G']) $(nucleotide_counts_sample['T'])")

###########################
#  Real problem solution  #
###########################

# Read in problem DNA string from .txt file
dna_string_problem = open("rosalind_dna.txt") do file
    read(file, String)
end

# Count nucleotides in DNA string and add to a dict
nucleotide_counts_problem = countmap(dna_string_problem)

# Print Problem Answer
println("$(nucleotide_counts_problem['A']) $(nucleotide_counts_problem['C']) $(nucleotide_counts_problem['G']) $(nucleotide_counts_problem['T'])")
