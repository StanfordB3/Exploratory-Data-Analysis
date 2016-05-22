## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#6. Compare emissions from motor vehicle sources in Baltimore City 
## with emissions from motor vehicle sources in 
## Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?
library(dplyr)
library(stringr)
library(ggplot2)
library(grid)
require(gridExtra)

# Merge the the SCC and NEI data set to associate SSC table info in to NEI
mrg <- merge(SCC, NEI, by.x = "SCC", by.y = "SCC")
x <- grep("Vehicle", mrg$EI.Sector)
V <- mrg[x, ]
V1 <- select(V, fips:year)
V2 <- subset(V1, fips == "24510")
V3 <- subset(V1, fips =="06037" )


# Open "png" graphics device
png(filename = "plot6.png", width = 600, height = 480, units = "px")

# Define number of grids/facets and layout 
# grid.arrange(plot1, plot2, ncol=2)

# Baltimore: Vehicular Emissions Trend
plot1 <- ggplot(V2, aes(factor(year), Emissions)) +
    geom_boxplot() +
    ylim(0, 20) + xlab("Year") + ylab("PM2.5 Emissions, Tons") +
    ggtitle("Baltimore: PM2.5 Vehicle Emissions Trend") +
    geom_smooth(method = "lm", se=FALSE, color="green", aes(group=1)) 

# Los Angeles County: Vehicular Emissions Trend
plot2 <- ggplot(V3, aes(factor(year), Emissions)) + 
    geom_boxplot() +
    ylim(0, 20) + xlab("Year") + ylab("PM2.5 Emissions, Tons") +
    ggtitle("Los Angeles: PM2.5 Vehicle Emissions Trend") + 
    geom_smooth(method = "lm", se=FALSE, color="green", aes(group=1)) 

# Display the two plots
grid.arrange(plot1, plot2, ncol=2)

dev.off()