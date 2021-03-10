#Question 4 Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
# read data
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# rebuild data set from NEI for designate element
related <- SCC[grep("coal", SCC$EI.Sector, ignore.case=TRUE), "SCC"]
set <- NEI[NEI$SCC %in% related, ]

# create plot
library(ggplot2)
ggplot(set, aes(x = factor(year),y = Emissions))+
        geom_bar(stat="identity", width=0.75) +
        labs(x="year", y=expression("coal combustion-related Emissions"))

#output .png file
dev.copy(png, file="plot4.png")
dev.off()
