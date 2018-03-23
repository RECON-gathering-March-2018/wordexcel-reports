library(tidyverse)
library(incidence)

linelist <- openxlsx::read.xlsx("../data/MERS-CoV-cases-rok-21Jul15.xlsx",startRow=4)

##Convert all columns containing the String "...Date..." to the Date class
##using the date/month/Year format (in which the data are available)
linelist <- linelist %>%
  mutate_if(grepl("Date",names(linelist)), as.Date, format="%d/%m/%Y")

inc <- incidence::incidence(linelist$Date.of.symptoms.onset, interval = 1)
plot(inc) + xlab("Calendar Time (day)") + ylab("Number of symptom onsets")
