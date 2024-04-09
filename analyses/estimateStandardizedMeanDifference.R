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