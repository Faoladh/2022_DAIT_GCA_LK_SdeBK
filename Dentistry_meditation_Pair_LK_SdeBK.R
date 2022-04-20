# Author:       Sadbh de Buitléir-Kearney, Leo Kenny
# Title:        PgDip Immersive Technology Pair Project
# Description:  Illustrating types, operators, constants, and functions 
# Date:         19/04/2022
# Version:      1.0
# Note:         
# See:          

#set working directory
setwd("~/GitHub/Data-Analytics-Rep")
projectData <- read.csv("dentistry_meditation.csv")

#extract The Treatment Data and Store as Variable
treatment <-projectData$Treatment; treatment

#Extract Anxiety Data and Store as Variable
anxiety <-projectData$Intraoperative.Anxiety..Galvanic.Response.; anxiety

#Extract Pain Data and Store as Variable
pain <-projectData$Perceived.Pain..Verbal.Numerical.Rating.Scale.; pain

#scatterplot of anxiety and pain test 
plot(x = anxiety, y=pain)


#t-test to see weather meditation or control feels more pain
treatmentPain.ttest <- t.test(formula= pain ~ treatment,
                              data = projectData,
                              subset= treatment %in% c("Meditation", "Control"))
treatmentPain.ttest #print result


#t-test to see weather meditation of control feels more anxiety
treatmentAnxiety.ttest <- t.test(formula= anxiety ~ treatment,
                                 data = projectData,
                                 subset= treatment %in% c("Meditation", "Control"))
treatmentAnxiety.ttest #print result

x <- 1
a <- 1

y <- treatment[1]

y

z <- treatment[2]

z

while(x <= 100)
{
  if(treatment[x] == y)
  {
    print("this is the meditation data: "); print(pain[x]); print(typeof(pain[x]))
  }
  x <- x+1
}

while(a <= 100)
{
  if(treatment[a] == z)
  {
    print("this the control data: "); print(pain[a]); print(typeof(pain[a]))
  }
  a <- a+1
}