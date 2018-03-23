library(officer)
library(mschart)

my_pres <- read_pptx()

my_pres <- my_pres %>% 
  add_slide(layout = "Title and Content", master = "Office Theme")

my_pres <- my_pres %>% 
  ph_with_text(type = "title", str = "A title") %>%
  ph_with_text(type = "ftr", str = "A footer") %>%
  ph_with_text(type = "dt", str = format(Sys.Date())) %>%
  ph_with_text(type = "sldNum", str = "slide 1") %>%
  ph_with_text(str = "Hello world", type = "body")


my_pres <- my_pres %>% 
  add_slide(layout = "Title and Content", master = "Office Theme") %>% 
  ph_with_text(type = "title", str = "An epicurve")


#####
library(tidyverse)
library(incidence)

setwd(here::here())

linelist <- openxlsx::read.xlsx("data/MERS-CoV-cases-rok-21Jul15.xlsx",startRow=4)

##Convert all columns containing the String "...Date..." to the Date class
##using the date/month/Year format (in which the data are available)
linelist <- linelist %>%
  mutate_if(grepl("Date",names(linelist)), as.Date, format="%d/%m/%Y")

inc <- incidence::incidence(linelist$Date.of.symptoms.onset, interval = 1)

inci_plot <- plot(inc) + xlab("Calendar Time (day)") + ylab("Number of symptom onsets")
my_pres <- ph_with_gg(my_pres, value = inci_plot + theme_minimal())

#Modifiable ggplot?  
my_pres <- my_pres %>% 
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with_text(type = "title", str = "An epicurve (modifiable)") %>% 
  ph_with_vg( ggobj = inci_plot + theme_minimal(), type = "body")


my_barchart <- ms_barchart(data = browser_data,
                           x = "browser", y = "value", group = "serie")
my_barchart <- chart_settings( x = my_barchart,
                               dir="vertical", grouping="clustered", gap_width = 50 )

my_pres <- my_pres %>% 
  add_slide(layout = "Title and Content", master = "Office Theme") %>% 
  ph_with_text(type = "title", str = "MS chart - modifiable") %>%
  ph_with_chart(chart = my_barchart, type = "body")


print(my_pres, target = "Output/expamle.pptx") 
