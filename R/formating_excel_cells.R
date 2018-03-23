library(openxlsx)
library(tidyverse)

#### Improt Data
file <- "data/MERS-CoV-cases-rok-21Jul15.xlsx"
linelist <- read.xlsx(file ,startRow=4)

# formatting classes

# var <- names(linelist)
linelist <- linelist %>%
  mutate_if(grepl("Date", names(linelist)), as.Date, format="%d/%m/%Y")


# adding workbook
wb <- createWorkbook()
addWorksheet(wb, "linelist")

writeDataTable(wb, 1, linelist, startRow = 4, startCol = 1, tableStyle = "TableStyleMedium2")
conditionalFormatting(wb, "linelist", cols = 10, rows = 1:190, type = "contains", rule = "Deceased")

# adding plot
png("incidence.png", width=733, height=538, units="px", res=144)
inc <- incidence::incidence(linelist$Date.of.symptoms.onset, interval = 1)
p <- plot(inc) + xlab("Calendar Time (day)") + ylab("Number of symptom onsets")
print(p)
dev.off() 

addWorksheet(wb, "Plot", gridLines=FALSE)
insertImage(wb, "Plot", "incidence.png", width=8.04, height=5.09, units="in")

openXL(wb)