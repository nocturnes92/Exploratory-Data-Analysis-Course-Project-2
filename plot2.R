#Question 2 Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# read data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# rebuild emissions to year set from NEI for designate location
set <- aggregate(Emissions ~ year, NEI[NEI$fips == "24510", ], sum)

# create plot use base plotting system
barplot(set$Emissions, names = set$year,xlab="Year",
        ylab="Emissions(Baltimore City, Maryland, 1999-2008)")

#output .png file
dev.copy(png, file="plot2.png")
dev.off()

