#=-----------------------------------------------------------------------------------
# Problem 003 - REVC
-----------------------------------------------------------------------------------=#

#=

Given: A DNA string s of length at most 1000 bp.

Return: The reverse complement sc of s.

=#

###########################
# Sample problem solution #
###########################

# Get DNA string
dna_string_sample = "AAAACCCGGT"

# Get function to get reverse complement of DNA string
function revc(dna_string::String)
    dna_string = reverse(dna_string)
    result = Char[]
    for i in 1:length(dna_string)
        if dna_string[i] == 'A'
        push!(result, 'T')

        elseif dna_string[i] == 'T'
            push!(result, 'A')

        elseif dna_string[i] == 'C'
            push!(result, 'G')

        elseif dna_string[i] == 'G'
            push!(result, 'C')
        end
    end
    return String(result)
end

# Ensure function works on sample problem
@assert revc(dna_string_sample) == "ACCGGGTTTT"

###########################
#  Real problem solution  #
###########################

# Read in problem DNA string from .txt file
dna_string_problem = open("rosalind_revc.txt") do file
    read(file, String)
end

# Print answer
println(revc(dna_string_problem))