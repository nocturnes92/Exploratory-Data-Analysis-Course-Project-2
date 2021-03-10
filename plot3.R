# Question 3 Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.


# read data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# create plot use ggplot2 plotting system for designate location
library(ggplot2)

baltimore <- NEI[NEI$fips=="24510", ]

ggplot(baltimore, aes(factor(year), Emissions, fill = type))+
        geom_bar(stat = "identity")+
        facet_grid(.~type, scales = "free",space = "free")+
        labs(x = "year", y = expression("Emissions(Baltimore City, Maryland, 1999-2008)"))

#output .png file
dev.copy(png, file="plot3.png")
dev.off()


