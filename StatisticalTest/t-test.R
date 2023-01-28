#st1<-read.csv('./csv_files/V00-FemoralCartilage-OAI-Cropping-CNN.csv')
#st2<-read.csv('./csv_files/V00-FemoralCartilage-OAI-exp5-Cropping-stage2.csv')
rm(list=ls())

st1<- read.table("./csv_files/V01/V01-FemoralCartilage-OAI-Cropping-CNN2.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
dfst1=as.data.frame(st1[2:ncol(st1)])
dfst1<-head(dfst1,-2)  # remove the last two rows if we have calculated mean and std

st2<- read.table("./csv_files/V01/V01-FemoralCartilage-OAI-exp5-Cropping-stage2.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
dfst2=as.data.frame(st2[2:ncol(st2)])
dfst2<-head(dfst2,-2)  # remove the last two rows if we have calculated mean and std

my_data<-data.frame(group=rep(c("cnn","cnn_and_hcl"),each=43),
                    dsc=c(dfst1$MeanDSC,dfst2$MeanDSC),stringsAsFactors=FALSE)
t.test(as.numeric(dfst2$MeanDSC),as.numeric(dfst1$MeanDSC), paired = TRUE,conf.level = 0.95)
# ASSD
my_data<-data.frame(group=rep(c("cnn","cnn_and_hcl"),each=43),
                    dsc=c(dfst1$ASD.mm.,dfst2$ASD.mm.),stringsAsFactors=FALSE)
print(my_data)
t.test(as.numeric(dfst2$ASD.mm.),as.numeric(dfst1$ASD.mm.), paired = TRUE,conf.level = 0.95)

# RMSD
my_data<-data.frame(group=rep(c("cnn","cnn_and_hcl"),each=43),
                    dsc=c(dfst1$RMSD.mm.,dfst2$RMSD.mm.),stringsAsFactors=FALSE)
print(my_data)
t.test(as.numeric(dfst2$RMSD.mm.),as.numeric(dfst1$RMSD.mm.), paired = TRUE,conf.level = 0.95)

# VOE
my_data<-data.frame(group=rep(c("cnn","cnn_and_hcl"),each=43),
                    dsc=c(dfst1$VOE...,dfst2$VOE...),stringsAsFactors=FALSE)
print(my_data)
t.test(as.numeric(dfst2$VOE...),as.numeric(dfst1$VOE...), paired = TRUE,conf.level = 0.95)

# VD
my_data<-data.frame(group=rep(c("cnn","cnn_and_hcl"),each=43),
                    dsc=c(dfst1$VD...,dfst2$VD...),stringsAsFactors=FALSE)
print(my_data)
t.test(as.numeric(dfst2$VD...),as.numeric(dfst1$VD...), paired = TRUE,conf.level = 0.95)

## T-Test
#LINK: https://rcompanion.org/rcompanion/d_09.html


###Tibial Cartilage
rm(list=ls())
st1<- read.table("./csv_files/alfred/TibialCartilage-Alfred-NoCropping-CNN.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
dfst1=as.data.frame(st1[2:ncol(st1)])
dfst1<-head(dfst1,-2)  # remove the last two rows if we have calculated mean and std

st2<- read.table("./csv_files/alfred/TibialCartilage-Alfred-exp4-NoCropping-stage2.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
dfst2=as.data.frame(st2[2:ncol(st2)])
dfst2<-head(dfst2,-2)  # remove the last two rows if we have calculated mean and std

my_data<-data.frame(group=rep(c("cnn","cnn_and_hcl"),each=40),
                    dsc=c(dfst1$MeanDSC,dfst2$MeanDSC),stringsAsFactors=FALSE)
print(my_data)
t.test(as.numeric(dfst2$MeanDSC),as.numeric(dfst1$MeanDSC), paired = TRUE,conf.level = 0.95)


# OAI-ZIB
st1<- read.table("./csv_files/OAI-ZIB/TC-OAI-ZIB-CNN-all.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
dfst1=as.data.frame(st1[2:ncol(st1)])

st2<- read.table("./csv_files/OAI-ZIB/TC-OAI-ZIB_stage2_all.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
dfst2=as.data.frame(st2[2:ncol(st2)])

my_data<-data.frame(group=rep(c("cnn","cnn_and_hcl"),each=242),
                    dsc=c(dfst1$VD,dfst2$VD),stringsAsFactors=FALSE)

t.test(as.numeric(dfst2$VD),as.numeric(dfst1$VD), paired = TRUE,conf.level = 0.95)

  ## T-Test
#LINK: https://rcompanion.org/rcompanion/a_02.html

# ASSD
my_data<-data.frame(group=rep(c("cnn","cnn_and_hcl"),each=40),
                    dsc=c(dfst1$ASD.mm.,dfst2$ASD.mm.),stringsAsFactors=FALSE)
print(my_data)
t.test(as.numeric(dfst2$ASD.mm.),as.numeric(dfst1$ASD.mm.), paired = TRUE,conf.level = 0.95)

# RMSD
my_data<-data.frame(group=rep(c("cnn","cnn_and_hcl"),each=40),
                    dsc=c(dfst1$RMSD.mm.,dfst2$RMSD.mm.),stringsAsFactors=FALSE)
print(my_data)
t.test(as.numeric(dfst2$RMSD.mm.),as.numeric(dfst1$RMSD.mm.), paired = TRUE,conf.level = 0.95)

# VOE
my_data<-data.frame(group=rep(c("cnn","cnn_and_hcl"),each=40),
                    dsc=c(dfst1$VOE...,dfst2$VOE...),stringsAsFactors=FALSE)
print(my_data)
t.test(as.numeric(dfst2$VOE...),as.numeric(dfst1$VOE...), paired = TRUE,conf.level = 0.95)

# VD
my_data<-data.frame(group=rep(c("cnn","cnn_and_hcl"),each=40),
                    dsc=c(dfst1$VD...,dfst2$VD...),stringsAsFactors=FALSE)
print(my_data)
t.test(as.numeric(dfst2$VD...),as.numeric(dfst1$VD...), paired = TRUE,conf.level = 0.95)



#To install dplyr package, type this:
  
#install.packages("dplyr")

#Compute summary statistics by groups:
  
library("dplyr",warn.conflicts = FALSE)
group_by(my_data, group) %>%
  summarise(
    count = n(),
    #mean=colMeans(dsc, na.rm = TRUE),
    mean(as.numeric(dsc), na.rm = TRUE),     #as.numeric saves as numbers
    #lapply(as.numeric(dsc), mean, na.rm = TRUE),
    sd = sd(dsc, na.rm = TRUE)
  )


#Visualize your data:
#install.packages("ggpubr")  
  # Plot weight by group and color by group
library("ggpubr")
ggboxplot(my_data, x = "group", y = "dsc", 
          color = "group", palette = c("#00AFBB", "#E7B800"),
          order = c("cnn", "cnn_and_hcl"),
          ylab = "DSC", xlab = "Groups")                    
