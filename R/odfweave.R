library("odfWeave")
inFile <- "Reports/SimpleReport.odt"
outFile <- "Reports/out.odt"

imageDefs <- getImageDefs()
imageDefs$dispWidth <- 4.5
imageDefs$dispHeight<- 4.5
setImageDefs(imageDefs)
odfWeave(inFile, outFile)

