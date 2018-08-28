library(ScottKnott)
library(readr)
dataValues<- read.csv('/CSVPATH/pLoc.csv',sep=",")
sk1 <- with(dataValues,SK(x=dataValues$language,y=dataValues$plocabslog,model='y ~ x',which='x',sig.level = 0.05))
summary(sk1)
pdf("/RESULT-PDF-PATH/pLoc_abs_sk.pdf",width=4,height=4)
plot(sk1, mm.lty=3,id.las=2.5,xlab="",title='pLoc_abs')
dev.off()


sk2 <- with(dataValues,SK(x=dataValues$language,y=dataValues$plocprolog,model='y ~ x',which='x'))
summary(sk2)
pdf("/RESULT-PDF-PATH/pLoc_rel_sk.pdf",width=4,height=4)
plot(sk2, mm.lty=3,id.las=2.5,xlab="",title='pLoc_rel')
dev.off()

dataValues<- read.csv('/CSVPATH/pTime_abs.csv',sep=",")
sk1 <- with(dataValues,SK(x=dataValues$language,y=dataValues$hourprolog,model='y ~ x',which='x'))
summary(sk1)
pdf("/RESULT-PDF-PATH/pTime_abs_sk.pdf",width=4,height=4)
plot(sk1, mm.lty=3,id.las=2.5,xlab="",title='pTime_abs')
dev.off()

dataValues<- read.csv('/CSVPATH/pTime_rel.csv',sep=",")
sk1 <- with(dataValues,SK(x=dataValues$language,y=dataValues$hourprolog,model='y ~ x',which='x'))
summary(sk1)
pdf("/RESULT-PDF-PATH/pTime_rel_sk.pdf",width=4,height=4)
plot(sk1, mm.lty=3,id.las=2.5,xlab="",title='pTime_rel')
dev.off()

dataValues<- read.csv('/CSVPATH/pFile.csv',sep=",")
sk1 <- with(dataValues,SK(x=dataValues$language,y=dataValues$filechangecount,model='y ~ x',which='x'))
summary(sk1)
pdf("/RESULT-PDF-PATH/pFile_abs_sk.pdf",width=4,height=4)
plot(sk1, mm.lty=3,id.las=2.5,xlab="",title='pFile_abs')
dev.off()

dataValues<- read.csv('/CSVPATH/pFile.csv',sep=",")
sk1 <- with(dataValues,SK(x=dataValues$language,y=dataValues$filepro,model='y ~ x',which='x'))
summary(sk1)
pdf("/RESULT-PDF-PATH/pFile_rel_sk.pdf",width=4,height=4)
plot(sk1, mm.lty=3,id.las=2.5,xlab="",title='pFile_rel')
dev.off()

dataValues<- read.csv('/CSVPATH/combine_sloc_domain_forFSE.csv',sep=",")
sk1 <- with(dataValues,SK(x=dataValues$domain,y=dataValues$plocprolog,model='y ~ x',which='x'))
summary(sk1)
plot(sk1, mm.lty=3,id.las=2.5,xlab="",title='pFile_rel')

sk1 <- with(dataValues,SK(x=dataValues$domain,y=dataValues$medium.bug,model='y ~ x',which='x'))
summary(sk1)
plot(sk1, mm.lty=3,id.las=2.5,xlab="",title='pFile_rel')



