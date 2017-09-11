#START

#Purpose of this script is to serve as dummy data for GitHub testing

#Set working drive
setwd("C:/Users/jcronan/Documents/GitHub/Test_Area/")

#Import input table template.
overstory.table <- read.table("overstory_table.csv", header=TRUE,
                         sep=",", na.strings="NA", dec=".", strip.white=TRUE)


#Format the input table and add ID numbers for 10,000 trees.
overstory.table <- matrix(data = c(1:10000, rep(0, 10000), rep(0, 10000)), 10000, 3)


##re-add the column names that were stripped when you turned the table into a matrix.
colnames(overstory.table) <- c("ID_number", "Diameter_in", "Height_ft")

#Convert the data table into a data frame.
overstory.table <- as.data.frame(overstory.table)

#Use the negative exponential distribution to populate the table with DBH values.
overstory.table$Diameter_in <- round(rexp(10000, rate =0.2 ),1)

#Create a function that will predict height and incorporate variability.
pred_ht <- function(x,y)
{
  round(rnorm(1, 4.5 + exp(7.26 + -5.89*(x^-0.28)), y),1)
}
#where x is diameter at breast height (DBH) in inches and y is standard deviation
#equation form is from Curtis 1967
#coefficients are from Hanus et al. 1999

#Populate data table with tree height data.
overstory.table$Height_ft <- sapply(overstory.table$Diameter_in, pred_ht, y = 1)

#Conflicting code
1 + 2 + 3

#Add some more conflicting code
3 + 4


#Add height to love crown
overstory.table$Ht2LC_ft <- overstory.table$Height_ft/2

#Identify date and time.
dt <- Sys.Date()
tm <- format(Sys.time(), format = "%H.%M.%S",
             tz = "", usetz = FALSE)

#Save file
write.csv(overstory.table, file = paste("output_file_on_",dt,"_",tm,".csv",sep = ""),
          quote = TRUE, eol = "\n", na = "NA", row.names = FALSE)

#END
