rm(list=ls())
st2<- read.table("./csv_files/alfred/TibialCartilage-Alfred-exp4-NoCropping-stage2.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
dfst2=as.data.frame(st2[2:ncol(st2)])
dfst2<-head(dfst2,-2)  # remove the last two rows if we have calculated mean and std

n<-length(dfst2$MeanDSC)

conf.level=0.95
m<-mean(as.numeric(dfst2$MeanDSC))  # mean of samples

z<-qt((1+conf.level)/2,df=n-1)  # or z<-qt((0.95)/2,df=n-1)

se=sd(as.numeric(dfst2$MeanDSC))/sqrt(n) # standard error of samples

ci<-z*se

left<-m-ci  # lower bound
right<-m+ci # upper bound


# OAI-ZIB
rm(list=ls())
st2<- read.table("./csv_files/OAI-ZIB/TC-OAI-ZIB_stage2_all.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
dfst2=as.data.frame(st2[2:ncol(st2)])
#dfst2<-head(dfst2,-2)  # remove the last two rows if we have calculated mean and std

n<-length(dfst2$dice)

conf.level=0.95
m<-mean(as.numeric(dfst2$dice))  # mean of samples

z<-qt((1+conf.level)/2,df=n-1)  # or z<-qt((0.95)/2,df=n-1)

se=sd(as.numeric(dfst2$dice))/sqrt(n) # standard error of samples

ci<-z*se

left<-m-ci  # lower bound
right<-m+ci # upper bound



