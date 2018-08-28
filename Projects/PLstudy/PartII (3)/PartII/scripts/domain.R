library("QuantPsyc")

lm.beta <- function (MOD) 
{ 
  b <- summary(MOD)$coef[-1, 1][1]
  sx <- sd(MOD$model[-1][1]) 
  sy <- sd(MOD$model[1][1]) 
  beta <- b * sx/sy 
  return(beta) 
} 

newdata<-read.csv('/Users/PLStudy/results/combine_sloc_domain_forFSE.csv',head=TRUE)
lm.thisnew <- lm(newdata$plocabslog~newdata$domain-1+newdata$commitlog+newdata$durationlog+newdata$contrilog)
summary(lm.thisnew)