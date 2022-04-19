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
colnames(projectData) <- c('Intraoperative Anxiety (Galvanic Response)', 'Perceived Pain (Verbal Numerical Rating Scale)')

projectData <- as.table(projectData)

projectData
