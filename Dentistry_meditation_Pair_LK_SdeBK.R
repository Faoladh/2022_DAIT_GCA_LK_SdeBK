# Author:       Sadbh de Buitléir-Kearney, Leo Kenny
# Title:        PgDip Immersive Technology Pair Project
# Description:  Illustrating types, operators, constants, and functions 
# Date:         19/04/2022
# Version:      1.0
# Note:         
# See:          

#set working directory
setwd("~/GitHub/Data-Analytics-Rep")
#read csv file

projectData <- read.csv("dentistry_meditation.csv")



#extract The Treatment Data and Store as Variable
treatment <-projectData$Treatment; treatment

#Extract Anxiety Data and Store as Variable
anxiety <-projectData$Intraoperative.Anxiety..Galvanic.Response.; anxiety

#Extract Pain Data and Store as Variable
pain <-projectData$Perceived.Pain..Verbal.Numerical.Rating.Scale.; pain

#scatterplot of anxiety and pain
#plot(x = anxiety, y=pain)


#t-test to see weather meditation or control feels more pain
treatmentPain.ttest <- t.test(formula= pain ~ treatment,
                              data = projectData,
                              subset= treatment %in% c("Meditation", "Control"))
treatmentPain.ttest #print result
treatmentPain.ttest$p.value

#t-test to see weather meditation of control feels more anxiety
treatmentAnxiety.ttest <- t.test(formula= anxiety ~ treatment,
                                 data = projectData,
                                 subset= treatment %in% c("Meditation", "Control"))
treatmentAnxiety.ttest #print result
treatmentAnxiety.ttest$p.value


plot(x = 1,                 
     xlab = "Intraoperative Anxiety [Galvanic Response]", 
     ylab = "Level [1-10]",
     xlim = c(0, 50), 
     ylim = c(0, 10),
     main = "Measured Anxiety",
     type = "n")
points(x = projectData$Intraoperative.Anxiety..Galvanic.Response.[projectData$Treatment == "Meditation"],
       pch = 16,
       col = "Green")
points(x = projectData$Intraoperative.Anxiety..Galvanic.Response.[projectData$Treatment == "Control"],
       pch = 16,
       col = "red")

legend("bottomright",                  # Put legend in bottom right of graph
       legend = c("Meditation", "Control"), # Names of groups
       col = c("green", "red"),      # Colors of symbols
       pch = c(16, 16))    
