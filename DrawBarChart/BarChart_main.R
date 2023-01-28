# library(tidyverse)
# 
# df <- data_frame(
#   "method" = c("M1","M2","M3","M4","M5", "M6"),
#   "Femoral_Cartilage" = c(82.8,84.96,87.8,89.4,97.79,98.49),
#   "Tibial_Cartilage" = c(83.9,84.74,80.85,88.25,97.79,98.23),
#   "Patellar_Cartilage" = c(73.9,79.16,76.7,0,96.37,97.4)
# )
# 
# df<-gather(df, key = "score", value = "value",na.rm = FALSE,-stat())
# 
# ggplot(df, aes(x = score, y = value, fill = stat)) +  geom_col(position = "dodge")
# 
# rm(list=ls())
# 
# 
# library(tidyverse)
# 
# df <- data_frame(
#   "stat" = c("mean", "max", "sd"),
#   "High_score" = c(55.6, 60, 5.1),
#   "Medium_score" = c(40, 45, 4.3),
#   "Low_score" = c(20, 28, 3.8)
# )
# 
# df <- gather(df, key = score, value = value, -stat)
# 
# ggplot(df, aes(x = score, y = value, fill = stat)) +  geom_col(position = "dodge")





library(RColorBrewer)   # link: https://www.datanovia.com/en/blog/top-r-color-palettes-to-know-for-great-data-visualization/
display.brewer.all()
#display.brewer.pal(n = 10, name = "PRGn")
# Open a pdf file
pdf("baseline_dsc.pdf") 

# set the colors

colours<-brewer.pal(n=6,name = "YlOrRd")
# read csv file as dataframe
df<- read.table("BaselineCartilage_DSC.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
tdf=as.data.frame(df[2:ncol(df)])

bb<- barplot(as.matrix(tdf), beside=T ,
             col=colours,border="white", ylim=c(0,100), ylab="DSC (%)",xlab="Knee Compartments")

y<-as.matrix(tdf)
text(bb,y+2,labels=as.character(y),pos =1,offset=3,cex = 0.6, col = "black")  

legend(-1,108, c("Dam et al.","Wang et al.","Norman et al.","Ambellan et al. (ZIB)","3D U-Net (Step I)", "JD-HCL (Step I+Step II)"),cex=0.5,inset=c(1,0),x.intersp=0.2,xjust=0, yjust=0,xpd=TRUE,  fill=colours,horiz=TRUE)
dev.off()

#***************************************Followup

pdf("followup_dsc.pdf")
#jpeg("folowup_dsc.jpg", width = 550, height = 550)

# set the colors
#colours<-c("#5E4FA2","#D53E4F","#FDAE61","#762A83","#9E0142","#238B45")
colours<-brewer.pal(n=6,name = "PuBuGn")
# read csv file as dataframe
df<- read.table("FollowupCartilage_DSC.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
tdf=as.data.frame(df[2:ncol(df)])

# draw the plot
bb<- barplot(as.matrix(tdf), beside=T ,
             col=colours,border="white", ylim=c(0,100), ylab="DSC (%)",xlab="Knee Compartments") 
#bb<- barplot(as.matrix(tdf), beside=T ,
#             col=colours,border="black", ylim=c(0,100), ylab="Percentage (%)",xlab="Methods")  #,args.legend = list(x = "bottomright", bty="n", inset=c(-0.50,2), xpd = TRUE), c("Dam et al.","Wang et al.","Norman et al.","ZIB","Proposed (Stage 1)", "Proposed (Stage 1+Stage 2)")
#colours<-c("lightblue", "mistyrose")
y<-as.matrix(tdf)
text(bb,y+2,labels=as.character(y),pos =1,offset=3,cex = 0.6, col = "black")   # add the values to the columns  (link: https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/text.html)

#legend("topleft", c("M1","M2","M3","M4","M5", "M6"), cex=0.6,inset=c(1,0),xpd=TRUE,  fill=colours)
legend(-1,108, c("Dam et al.","Wang et al.","Norman et al.","Ambellan et al. (ZIB)","3D U-Net (Step I)", "JD-HCL (Step I+Step II)"), cex=0.5,inset=c(1,0),x.intersp=0.2,xjust=0, yjust=0,xpd=TRUE,  fill=colours,horiz=TRUE)
# 3. Close the file
dev.off()
#==========================
