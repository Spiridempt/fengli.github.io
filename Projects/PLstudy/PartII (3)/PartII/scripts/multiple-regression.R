library("QuantPsyc")

lm.beta <- function (MOD) 
  { 
    b <- summary(MOD)$coef[-1, 1][1]
    sx <- sd(MOD$model[-1][1]) 
    sy <- sd(MOD$model[1][1]) 
    beta <- b * sx/sy 
    return(beta) 
  } 


v<-read.csv('/CSVPATH/pSloc.csv',head=TRUE)
lm.logploc_abs<-lm(v$plocabslog~v$language-1+v$sloclog+v$commitlog+v$durationlog+v$contrilog)
summary(lm.logploc_abs)

lm.logploc_abs<-lm(v$plocprolog~v$language-1+v$commitlog+v$durationlog+v$contrilog)
summary(lm.logploc_abs)

lm.logploc_pro<-lm(v$plocprolog~v$dynamicstatic-1+v$commitlog+v$durationlog+v$contrilog)
summary(lm.logploc_pro)
lm.logploc_pro<-lm(v$plocprolog~v$strongweak-1+v$commitlog+v$durationlog+v$contrilog)
summary(lm.logploc_pro)

t<-read.csv('/CSVPATH/pTime_abs.csv',head=TRUE)
lm.logtime_abs<-lm(t$hourabslog~t$dynamicstatic-1+t$sloclog+t$commitlog+t$durationlog+t$contrilog)
summary(lm.logtime_abs)
lm.logtime_abs<-lm(t$hourprolog~t$strongweak-1+t$sloclog+t$commitlog+t$durationlog+t$contrilog)
summary(lm.logtime_abs)

t<-read.csv('/CSVPATH/pTime_rel.csv',head=TRUE)
lm.logtime_pro<-lm(t$hourprolog~t$dynamicstatic-1+t$commitlog+t$durationlog+t$contrilog)
summary(lm.logtime_pro)
lm.logtime_pro<-lm(t$hourprolog~t$strongweak-1+t$commitlog+t$durationlog+t$contrilog)
summary(lm.logtime_pro)

t<-read.csv('/CSVPATH/pFile.csv',head=TRUE)
lm.logtime_abs<-lm(t$filechangecount~t$language-1+t$sloclog+t$commitlog+t$durationlog+t$contrilog)
summary(lm.logtime_abs)
lm.logtime_abs<-lm(t$filechangecount~t$strongweak-1+t$sloclog+t$commitlog+t$durationlog+t$contrilog)
summary(lm.logtime_abs)







