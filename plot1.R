#Question 1 Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# read data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# rebuild emissions to year set from NEI
set <- aggregate(Emissions ~ year, NEI, sum)

# create plot use base plotting system
barplot(set$Emissions, names = set$year,xlab="Year",ylab="Emissions")

#output .png file
dev.copy(png, file="plot1.png")
dev.off()
