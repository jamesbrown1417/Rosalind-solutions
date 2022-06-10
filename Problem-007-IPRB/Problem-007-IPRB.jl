#=-----------------------------------------------------------------------------------
# Problem 007 - IPRB 
-----------------------------------------------------------------------------------=#

#=

Given: Three positive integers k, m, and n, representing a population containing k+m+n organisms: k individuals are homozygous dominant for a factor, m are heterozygous, and n are homozygous recessive.

Return: The probability that two randomly selected mating organisms will produce an individual possessing a dominant allele (and thus displaying the dominant phenotype). Assume that any two organisms can mate.

=#

###########################
# Sample problem solution #
###########################

# Set variables
k_sample, m_sample, n_sample = 2, 2, 2

# Create function to get probability of dominant allele
function prob_dom_allele(k::Int64, m::Int64, n::Int64)
    
    # Get total possible pairs
    total_pairs = binomial(k + m + n, 2)

    # Get numbers of possible pairs satisfying different combinations

    # Dominant and Dominant - probability of offspring having dominant allele is 1
    dd = binomial(k, 2)

    # Heterozygous and Heterozygous - probability of offspring having dominant allele is 0.75
    hh = binomial(m, 2)

    # Recessive and Recessive - probability of offspring having dominant allele is 0
    rr = binomial(n, 2)

    # Dominant and Heterozygous - probability of offspring having dominant allele is 1
    dh = k * m

    # Dominant and Recessive - probability of offspring having dominant allele is 1
    dr = k * n

    # Heterozygous and Recessive - probability of offspring having dominant allele is 0.5
    hr = m * n

    # Confirm that all pairs are accounted for
    @assert dd + hh + rr + dh + dr + hr == total_pairs

    # Get probability of offspring having a dominant allele
    probability_of_dom_allele = ((1 * dd) + (0.75 * hh) + (0 * rr) + (1 * dh) + (1 * dr) + (0.5 * hr)) / total_pairs
    
    # Return solution
    return round(probability_of_dom_allele, digits = 5)
end

# Confirm that function returns correct answer for sample problem
@assert prob_dom_allele(k_sample, m_sample, n_sample) == 0.78333

###########################
#  Real problem solution  #
###########################

# Set variables
k, m, n = 17, 27, 27

# Get solution
println(prob_dom_allele(k, m, n))