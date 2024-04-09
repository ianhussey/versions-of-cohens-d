# in 2020 the package esci had a really nice function to calculate d_av (which is a very good metric) from summary statistics. 
# However its no longer in their package or the git repo's history. This is what it used to be named. Get the code from the authors?

cohens_dav <- function(data){
  require(esci)
  
  fit <- 
    esci::estimateStandardizedMeanDifference(m1 = data$mean_t2, 
                                             m2 = data$mean_t1, 
                                             s1 = data$sd_t2, 
                                             s2 = data$sd_t1, 
                                             n1 = data$n, 
                                             n2 = data$n,
                                             r  = data$r, 
                                             conf.level = .95,
                                             paired = TRUE) 
  
  return(tibble(es = fit$cohend,
                ci_lower = fit$cohend.low,
                ci_upper = fit$cohend.high,
                r  = fit$r))
}