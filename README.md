# wordexcel-reports

## Project setup
R together with knitr + pandoc has great capabilities to generate automatic reports in PDF, HTML and Word. However, as soon as you move one level up or one level sideways in the hierarchy, all your colleagues want are the resulting Word & Excel files and then they continue working on these files.

A number of packages exists to make the transition of results to Word/Excel easier (pandoc conversion, [reporteRs](https://davidgohel.github.io/ReporteRs/) - superseeded by [officer](https://cran.r-project.org/web/packages/officer/), [odfWeave](https://cran.r-project.org/web/packages/odfWeave/index.html), [xlsx](https://cran.r-project.org/web/packages/xlsx/xlsx.pdf), [openxlsx](https://cran.r-project.org/web/packages/openxlsx/index.html) ...). However, at the moment, I lack some clear recommendations in which situation which package is most useful. 

* Step 1 of the hack would be to survey the landscape and collect experiences
* Step 2 of the hack would be to try to survey technologic solutions to the highly missed feature of having your colleague's track/changes, comments or added text with an interpretation of the graphic merge back into your original Rmd document so that these comments prevail in new documents with updated numbers. Parts of this are already possible, so one first step would be to write a small practical on how to best integrate your work with Word/Excel based colleagues.
* Step 3 Ensure that the obtained products are accessible for people with impairments/disabilities (many public institutions need to generate such documents)
* Step 4 the sky (and the max 4 hours of effective hacking) is the limit

## Output 
Our 3 hour 5 person hackathon team ([Lore](https://github.com/loremerdrignac), [Sumali](https://github.com/sumalibajaj), [Stephan](https://github.com/gstephan30), [Lukas](https://github.com/lukric), [Michael](https://github.com/hoehleatsu)) output can be found here: [https://github.com/RECON-gathering-March-2018/wordexcel-reports](https://github.com/RECON-gathering-March-2018/wordexcel-reports). See the [*Issues*](https://github.com/RECON-gathering-March-2018/wordexcel-reports/issues) page to see some bullet points what we worked with. Download for example the export of a ggplot epicurve into a modifiable [Excel/Powerpoint](https://github.com/RECON-gathering-March-2018/wordexcel-reports/blob/master/Output/expamle.pptx) graphic in the Output directory - this is really neat!
