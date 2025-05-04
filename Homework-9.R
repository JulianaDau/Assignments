#R script Homework 9 March 26_2025
library(devtools)
install_github('ngotelli/upscaler')
library(upscaler)


add_folder()
add_folder(c("CountData"))
metadata_template(file="CountData/NEON.D01.BART.DP1.10003.001.brd_countdata.2015-06.basic.20241119T065914Z.csv")
metadata_template(file="CountData/NEON.D01.BART.DP1.10003.001.brd_countdata.2016-06.basic.20241119T142515Z.csv")
