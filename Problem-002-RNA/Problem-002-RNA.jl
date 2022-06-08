#=-----------------------------------------------------------------------------------
# Problem 002 - DNA
-----------------------------------------------------------------------------------=#

#=

Given: A DNA string t having length at most 1000 nt.

Return: The transcribed RNA string of t.Given: A DNA string s of length at most 1000 nt.

=#

###########################
# Sample problem solution #
###########################

# Read in sample DNA string
dna_string_sample = "GATGGAACTTGACTACGTAAATT"

# Get transcribed RNA string - sample
transcribed_rna_sample = replace(dna_string_sample, 'T' => 'U')

# Confirm answer equals given answer
@assert transcribed_rna_sample == "GAUGGAACUUGACUACGUAAAUU"

###########################
#  Real problem solution  #
###########################

# Read in problem DNA string from .txt file
dna_string_problem = open("rosalind_rna.txt") do file
    read(file, String)
end

# Get transcribed RNA string - problem
transcribed_rna_problem = replace(dna_string_problem, 'T' => 'U')

# Print Problem Answer
println("$transcribed_rna_problem")
