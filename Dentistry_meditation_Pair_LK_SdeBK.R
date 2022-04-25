# Author:       Sadbh de Buitléir-Kearney, Leo Kenny
# Title:        PgDip Immersive Technology Pair Project
# Description:  Pair Project for PgDipImmersive Tech 2022
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
anxiety <-projectData$Intraoperative.Anxiety..Galvanic.Response.; 

#Extract Pain Data and Store as Variable
pain <-projectData$Perceived.Pain..Verbal.Numerical.Rating.Scale.; 

#quantile of pain
quantile (pain, probs=c(0., 0.25, 0.75, 1))

#quantile of anxiety
quantile (anxiety, probs=c(0., 0.25, 0.75, 1))

##NTS FIGURE OUT HOW TO SUBDIVIDE THESE BY TREATMENT##

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

#Anxiety Plot
plot(x = 1,                 
     xlab = "Intraoperative Anxiety [Galvanic Response]", 
     ylab = "Level [1-10]",
     xlim = c(0, 50), 
     ylim = c(5, 10),
     main = "Measured Anxiety",
     type = "n")
points(x = anxiety[projectData$Treatment == "Meditation"],
       pch = 16,
       col = "Green")
points(x = anxiety[projectData$Treatment == "Control"],
       pch = 16,
       col = "red")
#Anxiety Legend
legend("bottomright",                  # Put legend in bottom right of graph
       legend = c("Meditation", "Control"), # Names of groups
       col = c("green", "red"),      # Colors of symbols
       pch = c(16, 16))    


#Pain Plot
plot(x = 1,                 
     xlab = "Perceived Pain [Verbal Numerical Rating Scale]", 
     ylab = "Level [1-10]",
     xlim = c(0, 50), 
     ylim = c(5, 10),
     main = "Measured Pain",
     type = "n")
points(x = pain[projectData$Treatment == "Meditation"],
       pch = 16,
       col = "Blue")
points(x = pain[projectData$Treatment == "Control"],
       pch = 16,
       col = "Orange")
#Pain Legend
legend("bottomright",                  # Put legend in bottom right of graph
       legend = c("Meditation", "Control"), # Names of groups
       col = c("Blue", "orange"),      # Colors of symbols
       pch = c(16, 16))    
#box plot of anxiety
boxplot(anxiety~treatment, main="Boxplot of Anxiety According to Treatment", ylim=c(4,10))



#box plot of pain
boxplot(pain~treatment, main="Boxplot of Pain According to Treatment", ylim=c(5,10))
