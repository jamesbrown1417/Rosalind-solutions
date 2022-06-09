#=-----------------------------------------------------------------------------------
# Problem 005 - GC 
-----------------------------------------------------------------------------------=#

#=

Given: At most 10 DNA strings in FASTA format (of length at most 1 kbp each).

Return: The ID of the string having the highest GC-content, followed by the GC-content of that string.

=#

###########################
# Sample problem solution #
###########################

# Use FASTX to read in FASTA file and save information to a Dict
using FASTX

# Function to read in FASTA file and return a dictionary with identifier as key and sequence as value 
function fasta_to_dict(file_path::String)
    reader = open(FASTA.Reader, file_path)

    sequences_dict = Dict()
    for record in reader
        seq_info = record
        seq_identifier = identifier(seq_info)
        seq_sequence = sequence(seq_info)
        sequences_dict[seq_identifier] = seq_sequence    
    end
    return sequences_dict
end

sample_dict = fasta_to_dict("sample_rosalind_gc.fasta")

# Create function to get max gc percentage and ID (as a tuple) from a series of DNA strings from a FASTA file
function max_gc_content(sequences::Dict)
    output = Dict()
    for (key,value) in sequences
        gc_string = replace(String(value), r"A|T" => "")
        gc_percentage = 100 * (length(gc_string) / length(value))
        output[key] = gc_percentage
    end
    return findmax(output)
end

# Confirm that function gives correct result on sample problem
println("$(max_gc_content(sample_dict)[2])\n$(max_gc_content(sample_dict)[1])")

###########################
#  Real problem solution  #
###########################

problem_dict = fasta_to_dict("rosalind_gc.fasta")

# Print answer
println("$(max_gc_content(problem_dict)[2])\n$(max_gc_content(problem_dict)[1])")
