library(gsDesign)

# Maxmimum sample size
max_n = 8771

# Input the # of completers at each interim perforemd
# including the current interim
interims_performed = c(6653)

# Compute the stopping boundary
# Note that, while this increases the max N
# the information fraction is preserved
design = gsDesign(
k = length(interims_performed)+1,
test.type = 1,
alpha = 0.025,
beta = 0.09, # This quantity does not affect the resulting boundary
n.fix = max_n, # This quantity does not affect the resulting boundary
timing = interims_performed/max_n,
sfu = sfLDOF
)

# Package so that the output looks nice
design_df = data.frame(
interims = c(interims_performed, max_n),
bound = pnorm(design$upper$bound),
spend = design$upper$spend
)
print(design_df)
