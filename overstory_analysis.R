
setwd("C:/Users/jcronan/Documents/GitHub/Test_Area/")
overstory.table <- read.table("overstory_table.csv", header=TRUE, 
                         sep=",", na.strings="NA", dec=".", strip.white=TRUE)



overstory.table <- matrix(data = c(1:10000, rep(0, 10000), rep(0, 10000)), 10000, 3)



