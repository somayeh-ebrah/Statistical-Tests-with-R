  library(devtools)
  library(easyGgplot2)
  library(ggplot2)
  library(gridExtra)
  
  #df_FB <-  read.csv( "./csv_files/oai-z-femurebone.csv" )
  #df_TB <- read.csv('./csv_files/oai-z-tibiabone.csv')
  df_FC <-  read.csv( "./csv_file/OAI-Z/oai-z-fc.csv" )
  df_TC <- read.csv('./csv_file/OAI-Z/oai-z-tc.csv')
  #FB_vio <- ggplot2.violinplot(data=df_FB, xName='Method',yName='Sensitivity',
  #                          xtitle="Femur Bone (FB)", ytitle="Sensitivity (%)", 
  #                          addMean=TRUE, meanPointShape=23, meanPointSize=3,
  #                          meanPointColor="black", meanPointFill="blue")
  
  
  ######### Femur Bone  ########
  # Use single color
  # pFB <-ggplot(df_FB, aes(x=Method, y=Sensitivity)) +
  #   geom_violin(trim=FALSE, fill='#A4A4A4', color="darkred")+
  #   geom_boxplot(width=0.1) 
  # 
  # # Change violin plot colors by groups
  # pFB<-ggplot(df_FB, aes(x=Method, y=Sensitivity, fill=Method)) +
  #   geom_violin(trim=FALSE)+
  #   geom_boxplot(width=0.1) 
  # # Use brewer color palettes
  # pFB+scale_fill_brewer(palette="Dark2")
  # pFB <- pFB +labs(x="Femur Bone (FB)", y = "Sensitivity (%)")
  # 
  # ######### Tibia Bone  ########
  # # Use single color
  # pTB <-ggplot(df_TB, aes(x=Method, y=Sensitivity)) +
  #   geom_violin(trim=FALSE, fill='#A4A4A4', color="darkred")+
  #   geom_boxplot(width=0.1) 
  # 
  # # Change violin plot colors by groups
  # pTB<-ggplot(df_TB, aes(x=Method, y=Sensitivity, fill=Method)) +
  #   geom_violin(trim=FALSE)+
  #   geom_boxplot(width=0.1) 
  # # Use brewer color palettes
  # pTB+scale_fill_brewer(palette="Dark2")
  # pTB <- pTB +labs(x="Tibia Bone (TB)", y = "Sensitivity (%)")
  
  
  # Femoral Cartilage 
  # Use single color
  pFC <-ggplot(df_FC, aes(x=Method, y=sensitivity)) +
    geom_violin(trim=FALSE, fill='#A4A4A4', color="darkred")+
    geom_boxplot(width=0.1) 
  
  # Change violin plot colors by groups
  pFC<-ggplot(df_FC, aes(x=Method, y=sensitivity, fill=Method)) +
    geom_violin(trim=FALSE,show.legend = FALSE)+
    geom_boxplot(width=0.1,show.legend = FALSE) 
  # Use brewer color palettes
  pFC+scale_fill_brewer(palette="Dark2")
  pFC <- pFC +labs(x="Femoral Cartilage (FC)", y = "Sensitivity (%)")
  
  #  Tbial Cartilage
  
  # Use single color
  pTC <-ggplot(df_TC, aes(x=Method, y=sensitivity)) +
    geom_violin(trim=FALSE, fill='#A4A4A4', color="darkred")+
    geom_boxplot(width=0.1) 
  
  # Change violin plot colors by groups
  pTC<-ggplot(df_TC, aes(x=Method, y=sensitivity, fill=Method)) +
    geom_violin(trim=FALSE)+
    geom_boxplot(width=0.1) 
  # Use brewer color palettes
  pTC+scale_fill_brewer(palette="Dark2")
  pTC <- pTC +labs(x="Tibial Cartilage (TC)", y = "Sensitivity (%)")
  
  
  # finalplot <-ggplot2.multiplot(pFB,pFC,pTB,pTC ,cols=2)
  finalplot <-ggplot2.multiplot(pFC,pTC ,cols=2)
  #ggsave(filename="Alfred-Sens.pdf", plot=finalplot)
  
  # grid
  #gridAB  <- grid.arrange(pFB,pFC,pTB,pTC,top = "OAI-ZIB Dataset")
  # Export
  #ggsave(filename="Alfred-Sens.pdf", plot=gridAB)
  
  
  #install.packages("gridExtra")
  #library("gridExtra")
  #grid.arrange(pFB,pTB)
  
  
  
  # Femoral Cartilage 
  # Use single color
  pFC_fp <-ggplot(df_FC, aes(x=Method, y=false_positive)) +
    geom_violin(trim=FALSE, fill='#A4A4A4', color="darkred")+
    geom_boxplot(width=0.1) 
  
  # Change violin plot colors by groups
  pFC_fp<-ggplot(df_FC, aes(x=Method, y=false_positive, fill=Method)) +
    geom_violin(trim=FALSE,show.legend = FALSE)+
    geom_boxplot(width=0.1,show.legend = FALSE) 
  # Use brewer color palettes
  #pFC_fp+scale_fill_brewer(palette="Dark2")
  pFC_fp <- pFC_fp +scale_fill_brewer(palette="Dark2")+labs(x="Femoral Cartilage (FC)", y = "False Positive")
  
  #  Tbial Cartilage
  
  # Use single color
  pTC_fp <-ggplot(df_TC, aes(x=Method, y=false_positive)) +
    geom_violin(trim=FALSE, fill='#A4A4A4', color="darkred")+
    geom_boxplot(width=0.1) 
  
  # Change violin plot colors by groups
  pTC_fp<-ggplot(df_TC, aes(x=Method, y=false_positive, fill=Method)) +
    geom_violin(trim=FALSE)+
    geom_boxplot(width=0.1) 
  # Use brewer color palettes
  #pTC_fp+scale_fill_brewer(palette="Dark2")
  pTC_fp <- pTC_fp +scale_fill_brewer(palette="Dark2")+labs(x="Tibial Cartilage (TC)", y = "False Positive")
  
  
  # finalplot <-ggplot2.multiplot(pFB,pFC,pTB,pTC ,cols=2)
  #finalplot <-ggplot2.multiplot(pFC,pTC,pFC_fp,pTC_fp ,cols=2)
  #ggsave(filename="Alfred-Sens.pdf", plot=finalplot)
  
  # grid
  gridAB  <- grid.arrange(pFC,pTC,pFC_fp,pTC_fp,top = "OAI-ZIB Dataset")
  # Export
  ggsave(filename="Z-Sens-FalsePositive.pdf", plot=gridAB)
