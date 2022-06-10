#=-----------------------------------------------------------------------------------
# Problem 008 - PROT
-----------------------------------------------------------------------------------=#

#=

Given: An RNA string s corresponding to a strand of mRNA (of length at most 10 kbp).

Return: The protein string encoded by s.

=#

###########################
# Sample problem solution #
###########################

# Create Dictionary of Codon => Protein
RNA_codon_table =
Dict(
"UUU" => "F",
"CUU" => "L",
"AUU" => "I",
"GUU" => "V",
"UUC" => "F",
"CUC" => "L",
"AUC" => "I",
"GUC" => "V",
"UUA" => "L",
"CUA" => "L",
"AUA" => "I",
"GUA" => "V",
"UUG" => "L",
"CUG" => "L",
"AUG" => "M",
"GUG" => "V",
"UCU" => "S",
"CCU" => "P",
"ACU" => "T",
"GCU" => "A",
"UCC" => "S",
"CCC" => "P",
"ACC" => "T",
"GCC" => "A",
"UCA" => "S",
"CCA" => "P",
"ACA" => "T",
"GCA" => "A",
"UCG" => "S",
"CCG" => "P",
"ACG" => "T",
"GCG" => "A",
"UAU" => "Y",
"CAU" => "H",
"AAU" => "N",
"GAU" => "D",
"UAC" => "Y",
"CAC" => "H",
"AAC" => "N",
"GAC" => "D",
"UAA" => "Stop",
"CAA" => "Q",
"AAA" => "K",
"GAA" => "E",
"UAG" => "Stop",
"CAG" => "Q",
"AAG" => "K",
"GAG" => "E",
"UGU" => "C",
"CGU" => "R",
"AGU" => "S",
"GGU" => "G",
"UGC" => "C",
"CGC" => "R",
"AGC" => "S",
"GGC" => "G",
"UGA" => "Stop",
"CGA" => "R",
"AGA" => "R",
"GGA" => "G",
"UGG" => "W",
"CGG" => "R",
"AGG" => "R",
"GGG" => "G"
)

# Sample RNA string
sample_rna_string = "AUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA"

# Create function that converts an RNA string to a protein string
function rna_to_protein(rna_string::String)
    start = 0
    protein = String[]
    for i in 1:3:(length(rna_string) - 3)
        if start == 0
            if RNA_codon_table[rna_string[i:i+2]] == "M"
                start = 1
                push!(protein, "M")
            else
                continue
            end
        elseif RNA_codon_table[rna_string[i:i+2]] != "Stop"
            push!(protein, RNA_codon_table[rna_string[i:i+2]])
        else
            break
        end
    end
    return join(protein)
end

# Confirm that function works on test case

@assert rna_to_protein(sample_rna_string) == "MAMAPRTEINSTRING"

###########################
#  Real problem solution  #
###########################

# Read in problem RNA string from .txt file
rna_string_problem = open("rosalind_prot.txt") do file
    read(file, String)
end

println(rna_to_protein(rna_string_problem))