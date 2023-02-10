#This approximation follows from the Bernstein von-Mises theorem, informally known as the Bayesian central limit theorem.

#' Bernstein von-Mises approximation for preditive probabilities
#' @param super: real in [0, 1]. Posterior probability of superiority
#' @param n: number of completers on the intervention
#' @param N: maximum sample size of the intervention at the final analysis
#' @param alpha: 1 - the success threshold at the final analysis.

super_to_pred = function(super, n, N=8771, alpha=0.025){
# Convert the posterior probability to a standardized effect
delta = qnorm(super) / sqrt(n)
# Find the predictive distribution of the Z-value
mu = delta * sqrt(N)
sigma2 = (N-n)/N * (1 + (N-n)/n)
# Compute the probability of exceeding the threshold
1 - pnorm(
q = qnorm(1-alpha),
mean = mu,
sd = sqrt(sigma2)
)
}
