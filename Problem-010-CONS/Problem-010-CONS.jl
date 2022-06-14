#=-----------------------------------------------------------------------------------
# Problem 010 - CONS 
-----------------------------------------------------------------------------------=#

#=

Given: A collection of at most 10 DNA strings of equal length (at most 1 kbp) in FASTA format.

Return: A consensus string and profile matrix for the collection. (If several possible consensus strings exist, then you may return any one of them.)Given: Two DNA strings s and t (each of length at most 1 kbp).

=#

###########################
# Sample problem solution #
###########################

# Use FASTX to read in FASTA file and save information to an array
using FASTX
using NamedArrays

# Function to read in FASTA file and return an array with all sequences as strings
function fasta_to_array(file_path::String)
    reader = open(FASTA.Reader, file_path)
    sequences_array = AbstractString[]
    for (i,record) in enumerate(reader)
        seq_info = record
        seq_sequence = String(sequence(seq_info))
        push!(sequences_array, seq_sequence) 
    end
    return sequences_array
end

# Function to get profile matrix
function get_profile_matrix(sequence_array::Vector{AbstractString})
    profile_matrix = zeros(Integer, 4, length(sequence_array[1]))
    for sequence in sequence_array
        for (position, character) in enumerate(sequence)
            if character == 'A'
                profile_matrix[1, position] += 1
            elseif character == 'C'
                profile_matrix[2, position] += 1
            elseif character == 'G'
                profile_matrix[3, position] += 1
            elseif character == 'T'
                profile_matrix[4, position] += 1
            end
        end    
    end
    returned_array = NamedArray(profile_matrix)
    setnames!(returned_array, ["A", "C", "G", "T"], 1)  
    return returned_array
end

# Function to get consensus sequence
function get_consensus_seq(profile_matrix::NamedMatrix{Integer})
    consensus_string = []
    for i in 1:size(profile_matrix, 2)
        col_max = findmax(profile_matrix[1:end, i])[2]
        if col_max == 1
            push!(consensus_string, 'A')
        elseif col_max == 2
            push!(consensus_string, 'C')
        elseif col_max == 3
            push!(consensus_string, 'G')
        elseif col_max == 4
            push!(consensus_string, 'T')
        end
    end
    return join(consensus_string)
end

# Get solution to sample and check that it is correct
sample_array = fasta_to_array("sample_rosalind_cons.fasta")
sample_profile_matrix = get_profile_matrix(sample_array)
sample_consensus_sequence = get_consensus_seq(sample_profile_matrix)

# Print answer
println(sample_consensus_sequence)
for i in 1:size(sample_profile_matrix, 1)
    print(names(sample_profile_matrix)[1][i], ": ")
    for j in 1:size(sample_profile_matrix, 2)
        print(sample_profile_matrix[i,j], " ")
    end
    println("")
end

###########################
# Problem solution        #
###########################

# Get solution
problem_array = fasta_to_array("rosalind_cons.fasta")
profile_matrix = get_profile_matrix(problem_array)
consensus_sequence = get_consensus_seq(profile_matrix)

# Print final answer
println(consensus_sequence)
for i in 1:size(profile_matrix, 1)
    print(names(profile_matrix)[1][i], ": ")
    for j in 1:size(profile_matrix, 2)
        print(profile_matrix[i,j], " ")
    end
    println("")
end