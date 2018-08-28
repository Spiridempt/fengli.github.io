library(ggplot2)
library(scales)

dataa <- read.csv("/CSVPATH/pSloc.csv",TRUE)
dataa$language<-factor(dataa$language,levels = c("C","C#","C++","Go","Java","JS","Obj-C","PHP", "Python", "Ruby"))
dd<-ggplot(dataa,aes(x=language,y=dataa$plocabslog,col = language),stat="identity")+geom_violin(size=1.5)+
  theme(panel.background = element_blank(),plot.title = element_text(family="Helvetica", color="#666666", face="bold",size=29,hjust=0.1),axis.line = element_line(colour = "black"),legend.position = "none", legend.text=element_text(size=1.57),axis.title.x = element_text(size=23,colour = "black"),axis.title.y = element_text(size=23,colour = "black"),axis.text.y = element_text(colour = "black", size=23),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("")+
  ggtitle("pLoc_abs")+
  scale_y_continuous(breaks=seq(0,3,1))
dd
ggsave(dd,file="/RESULT-PDF-PATH/ploc_abs_violin.pdf",width = 9, height = 6)

dataa <- read.csv("/CSVPATH/pSloc.csv",TRUE)
dataa$language<-factor(dataa$language,levels = c("C","C#","C++","Go","Java","JS","Obj-C","PHP", "Python", "Ruby"))
dd<-ggplot(dataa,aes(x=language,y=dataa$plocprolog,col = language),stat="identity")+geom_violin(size=1.5)+
  theme(panel.background = element_blank(),plot.title = element_text(family="Helvetica", color="#666666", face="bold",size=29,hjust=0.1),axis.line = element_line(colour = "black"),legend.position = "none", legend.text=element_text(size=1.57),axis.title.x = element_text(size=23,colour = "black"),axis.title.y = element_text(size=23,colour = "black"),axis.text.y = element_text(colour = "black", size=23),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("")+
  ggtitle("pLoc_rel")+
  scale_y_continuous(breaks=seq(-5,0,2))
dd
ggsave(dd,file="/RESULT-PDF-PATH/ploc_pro_violin.pdf",width = 9, height = 6)

dataa <- read.csv("/CSVPATH/pTime_abs.csv",TRUE)
dataa$language<-factor(dataa$language,levels = c("C","C#","C++","Go","Java","JS","Obj-C","PHP", "Python", "Ruby"))
dd<-ggplot(dataa,aes(x=language,y=dataa$hourprolog,col = language),stat="identity")+geom_violin(size=1.5)+
  theme(panel.background = element_blank(),plot.title = element_text(family="Helvetica", color="#666666", face="bold",size=29,hjust=0.1),axis.line = element_line(colour = "black"),legend.position = "none", legend.text=element_text(size=1.57),axis.title.x = element_text(size=23,colour = "black"),axis.title.y = element_text(size=23,colour = "black"),axis.text.y = element_text(colour = "black", size=23),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("")+
  ggtitle("pTime_abs")+
  scale_y_continuous(breaks=seq(0,5,2))
dd
ggsave(dd,file="/RESULT-PDF-PATH/ptime_abs_violin.pdf",width = 9, height = 6)

dataa <- read.csv("/CSVPATH/pTime_rel.csv",TRUE)
dataa$language<-factor(dataa$language,levels = c("C","C#","C++","Go","Java","JS","Obj-C","PHP", "Python", "Ruby"))
dd<-ggplot(dataa,aes(x=language,y=dataa$hourprolog,col = language),stat="identity")+geom_violin(size=1.5)+
  theme(panel.background = element_blank(),plot.title = element_text(family="Helvetica", color="#666666", face="bold",size=29,hjust=0.1),axis.line = element_line(colour = "black"),legend.position = "none", legend.text=element_text(size=1.57),axis.title.x = element_text(size=23,colour = "black"),axis.title.y = element_text(size=23,colour = "black"),axis.text.y = element_text(colour = "black", size=23),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("")+
  ggtitle("pTime_rel")+
  scale_y_continuous(breaks=seq(-5,0,2))
dd
ggsave(dd,file="/RESULT-PDF-PATH/ptime_pro_violin.pdf",width = 9, height = 6)


dataa <- read.csv("/CSVPATH/pFile.csv",TRUE)
dataa$language<-factor(dataa$language,levels = c("C","C#","C++","Go","Java","JS","Obj-C","PHP", "Python", "Ruby"))
dd<-ggplot(dataa,aes(x=language,y=dataa$fileabslog,col = language),stat="identity")+geom_violin(size=1.5)+
  theme(panel.background = element_blank(),plot.title = element_text(family="Helvetica", color="#666666", face="bold",size=29,hjust=0.1),axis.line = element_line(colour = "black"),legend.position = "none", legend.text=element_text(size=1.57),axis.title.x = element_text(size=23,colour = "black"),axis.title.y = element_text(size=23,colour = "black"),axis.text.y = element_text(colour = "black", size=23),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("")+
  ggtitle("pFile_abs")+
  scale_y_continuous(breaks=seq(0,1,0.5))
dd
ggsave(dd,file="/RESULT-PDF-PATH/pfile_abs_violin.pdf",width = 9, height = 6)

dataa <- read.csv("/CSVPATH/pFile.csv",TRUE)
dataa$language<-factor(dataa$language,levels = c("C","C#","C++","Go","Java","JS","Obj-C","PHP", "Python", "Ruby"))
dd<-ggplot(dataa,aes(x=language,y=dataa$fileprolog,col = language),stat="identity")+geom_violin(size=1.5)+
  theme(panel.background = element_blank(),plot.title = element_text(family="Helvetica", color="#666666", face="bold",size=29,hjust=0.1),axis.line = element_line(colour = "black"),legend.position = "none", legend.text=element_text(size=1.57),axis.title.x = element_text(size=23,colour = "black"),axis.title.y = element_text(size=23,colour = "black"),axis.text.y = element_text(colour = "black", size=23),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("")+
  ggtitle("pFile_rel")+
  scale_y_continuous(breaks=seq(-5,0,2))
dd
ggsave(dd,file="/RESULT-PDF-PATH/pfile_pro_violin.pdf",width = 9, height = 6)

