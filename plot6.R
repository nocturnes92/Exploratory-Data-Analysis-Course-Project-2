#Question 6 Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
# read data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# rebuild data set from NEI for designate element
related <- SCC[grep("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE), "SCC"]
set <- NEI[NEI$SCC %in% related, ]

balset <- set[set$fips == "24510", ]
balset$city <- "Baltimore City"

calset <- set[set$fips == "06037", ]
calset$city <- "Los Angeles County, California"

bindset <- rbind(balset,calset)

# create plot
library(ggplot2)
ggplot(bindset, aes(x = factor(year),y = Emissions, fill = city))+
        geom_bar(stat="identity") +
        facet_grid(.~city, scales="free", space="free") +
        labs(x="year", y=expression("Motor Vehicle Source Emissions(Baltimore vs. Los Angeles"))

#output .png file
dev.copy(png, file="plot6.png")
dev.off()

