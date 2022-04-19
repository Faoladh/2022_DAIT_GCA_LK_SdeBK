# Author:       Sadbh de Buitléir-Kearney, Leo Kenny
# Title:        PgDip Immersive Technology Pair Project
# Description:  Illustrating types, operators, constants, and functions 
# Date:         19/04/2022
# Version:      1.0
# Note:         
# See:          

#set working directory
setwd("~/GitHub/Data-Analytics-Rep")
#Load Data from .csv file
projectData <- read.csv("dentistry_meditation.csv")
summary(projectData)
rownames(projectData) <- c('Control', 'Meditation')
colnames(projectData) <- c('Sex', 'C/M', 'Anxiety', 'Pain')

projectData <- as.table(projectData)

projectData

P <- projectData$Pain; P

A <- projectData$Anxiety; A

C <- projectData$`C/M`; C

x <- 0

While(x <= 100){
  
  if(projectData[x] == 'Control')
    {
    
    print(P[x], A[x])
    
    x <- x+1
    
  }
  
  else
    {
    
    print(P[x], A[x])
    
  }
  
}