#Question 5 How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
# read data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# rebuild data set from NEI for designate element
related <- SCC[grep("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE), "SCC"]
set <- NEI[NEI$SCC %in% related, ]
set <- set[set$fips == "24510", ]

# create plot
library(ggplot2)
ggplot(set, aes(x = factor(year),y = Emissions))+
        geom_bar(stat="identity") +
        labs(x="year", y=expression("Motor Vehicle Source Emissions in Baltimore"))

#output .png file
dev.copy(png, file="plot5.png")
dev.off()

