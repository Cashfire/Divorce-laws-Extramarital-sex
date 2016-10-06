setwd("F:/datastatistics/Project1")
download.file(url = "http://bit.ly/dasi_project_template", 
              destfile = "dasi_project_template.Rmd")
load(url("http://bit.ly/dasi_gss_data"))
gss1<-subset(gss, gss$year>=2002)  ##get 16128 obs. * 114 variables
gss2<-cbind(gss1$divlaw, gss1$xmarsex)
data<- as.data.frame(gss2[complete.cases(gss2), ])  ##3645 * 2
##compare the divoce law "easier" advocate and "more difficult" voter
colnames(data)<- c("divorcelaw","extramaritalsex")
tab<-table(data$divorcelaw,data$extramaritalsex) ##23 pushers VS. 18 obstructors justify 
prop<-prop.table(tab,1)  ##2.2% pushers VS 1.0% obstructors justfify  
rownames(prop)<-c("should Easier","more difficult","stay the same")
mosaicplot(prop, color=T, 
           main="Make divorce laws easier and justify extramarital sex?",
           xlab="Divorce law attitud",
           ylab="Extramarital sex attitude",
           cex.axis =0.8)

           
