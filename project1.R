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
# inference
tab1<-tab
totalLaw<-rowSums(tab)
tab2<-cbind(tab1,totalLaw)
totalSex<-colSums(tab2)
tab3<-rbind(tab2,totalSex)
tab4<-as.data.frame(t(tab3))
pchisq(169.42, 6, lower.tail=F)
## [1] 5.970443e-34

###
Conclusion:
Yes, those who think the divorce laws should be easier are also prone justify the extramarital sex as “no wrong at all” 
than those who think divorce laws should be difficult. According to this data analysis, 
if a person said he/she thinks the divorce laws should be easier, you can guess he/she pretends to justify extramarital sex. 
The H0 hypothesis is rejected because the result of chi-sqaure test is so small. 
However, the type I error may be occur if H0 is in fact true while we rejected it, 
so further research should be conducted to check the type I error.

References:
Data source: http://bit.ly/dasi_gss_data The data above is General Social Survey (GSS). 
Its codebook is: https://d396qusza40orc.cloudfront.net/statistics%2Fproject%2Fgss1.html 
The data Citation is: Smith, Tom W., Michael Hout, and Peter V. Marsden. General Social Survey, 1972-2012 [Cumulative File]. 
ICPSR34802-v1. Storrs, CT: Roper Center for Public Opinion Research, University of Connecticut /Ann Arbor, 
MI: Inter-university Consortium for Political and Social Research [distributors], 2013-09-11. 
doi:10.3886/ICPSR34802.v1 Persistent URL: http://doi.org/10.3886/ICPSR34802.v1
###
