## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
#  SCC <- readRDS("Source_Classification_Code.rds")

# 3.  Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions 
## from 1999–2008 for Baltimore City?
## Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
Baltimore <- subset(NEI, fips == "24510")
B1 <- subset(NEI, fips == "24510" & type == "NONPOINT")

# Open "png" graphics device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

g <- ggplot(Baltimore, aes(year, Emissions))
g <- g + geom_point() + geom_smooth(method = "lm") + facet_grid(.~type) + 
    ggtitle("Baltimore City :: Pollutant Trend by Type") + ylim(0, 25) + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
    ylab("Emissions, tons")
print(g)

dev.off()