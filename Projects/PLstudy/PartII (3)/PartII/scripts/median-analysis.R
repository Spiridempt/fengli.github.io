library(ggplot2)

dataa <- read.csv("/CSVPATH/medianvalues/ploc_abs.csv",TRUE)
dataa$language<-factor(dataa$language,levels = unique(dataa$language))
dd<-ggplot(dataa)+geom_bar(stat="identity",fill = "white" , color="red",aes(x=language,y=medianabs))+
  theme(panel.background = element_blank(),axis.line = element_line(colour = "black"),legend.title=element_text(size=33), legend.text=element_text(size=17),axis.title.x = element_text(size=33,colour = "black"),axis.title.y = element_text(size=28,colour = "black"),axis.text.y = element_text(colour = "black", size=33),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("pLoc_abs")+
  scale_y_continuous(breaks=seq(0,30,10))
dd
ggsave(dd,file="/RESULT-PDF-PATH/ploc_abs.pdf",width = 10, height = 5)

dataa <- read.csv("/CSVPATH/medianvalues/ploc_pro.csv",TRUE)
dataa$language<-factor(dataa$language,levels = unique(dataa$language))
dd<-ggplot(dataa)+geom_bar(stat="identity",fill = "white" , color="red",aes(x=language,y=medianabs))+
  theme(panel.background = element_blank(),axis.line = element_line(colour = "black"),legend.title=element_text(size=33), legend.text=element_text(size=17),axis.title.x = element_text(size=33,colour = "black"),axis.title.y = element_text(size=28,colour = "black"),axis.text.y = element_text(colour = "black", size=33),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("pLoc_rel")+
  scale_y_continuous(breaks=seq(0,0.005,0.002))
dd
ggsave(dd,file="/RESULT-PDF-PATH/ploc_pro.pdf",width = 10, height = 5)


dataa <- read.csv("/CSVPATH/medianvalues/ptime_abs.csv",TRUE)
dataa$language<-factor(dataa$language,levels = unique(dataa$language))
dd<-ggplot(dataa)+geom_bar(stat="identity",fill = "white" , color="red",aes(x=language,y=medianabs))+
  theme(panel.background = element_blank(),axis.line = element_line(colour = "black"),legend.title=element_text(size=33), legend.text=element_text(size=17),axis.title.x = element_text(size=33,colour = "black"),axis.title.y = element_text(size=28,colour = "black"),axis.text.y = element_text(colour = "black", size=33),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("pTime_abs")+
  scale_y_continuous(breaks=seq(0,500,100))
dd
ggsave(dd,file="/RESULT-PDF-PATH/ptime_abs.pdf",width = 10, height = 5)

dataa <- read.csv("/CSVPATH/medianvalues/ptime_pro.csv",TRUE)
dataa$language<-factor(dataa$language,levels = unique(dataa$language))
dd<-ggplot(dataa)+geom_bar(stat="identity",fill = "white" , color="red",aes(x=language,y=medianabs))+
  theme(panel.background = element_blank(),axis.line = element_line(colour = "black"),legend.title=element_text(size=33), legend.text=element_text(size=17),axis.title.x = element_text(size=33,colour = "black"),axis.title.y = element_text(size=28,colour = "black"),axis.text.y = element_text(colour = "black", size=33),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("pTime_rel")+
  scale_y_continuous(breaks=seq(0,0.02,0.01))
dd
ggsave(dd,file="/RESULT-PDF-PATH/ptime_pro.pdf",width = 10, height = 5)

dataa <- read.csv("/CSVPATH/medianvalues/pfile_abs.csv",TRUE)
dataa$language<-factor(dataa$language,levels = unique(dataa$language))
dd<-ggplot(dataa)+geom_bar(stat="identity",fill = "white" , color="red",aes(x=language,y=medianabs))+
  theme(panel.background = element_blank(),axis.line = element_line(colour = "black"),legend.title=element_text(size=33), legend.text=element_text(size=17),axis.title.x = element_text(size=33,colour = "black"),axis.title.y = element_text(size=28,colour = "black"),axis.text.y = element_text(colour = "black", size=33),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("pFile_abs")+
  scale_y_continuous(breaks=seq(0,5,2))
dd
ggsave(dd,file="/RESULT-PDF-PATH/pfile.pdf",width = 10, height = 5)


dataa <- read.csv("/CSVPATH/medianvalues/pfile_pro.csv",TRUE)
dataa$language<-factor(dataa$language,levels = unique(dataa$language))
dd<-ggplot(dataa)+geom_bar(stat="identity",fill = "white" , color="red",aes(x=language,y=medianabs))+
  theme(panel.background = element_blank(),axis.line = element_line(colour = "black"),legend.title=element_text(size=33), legend.text=element_text(size=17),axis.title.x = element_text(size=33,colour = "black"),axis.title.y = element_text(size=28,colour = "black"),axis.text.y = element_text(colour = "black", size=33),axis.text.x = element_text(angle=45,hjust=1.0,colour = "black", size=30))+
  xlab("")+
  ylab("pFile_rel")+
  scale_y_continuous(breaks=seq(0,0.05,0.01))
dd
ggsave(dd,file="/RESULT-PDF-PATH/pfile_pro.pdf",width = 10, height = 5)
