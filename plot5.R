## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
# SCC1 <- select(SCC, )
library(dplyr)
library(stringr)
library(ggplot2)
library(grid)

mrg <- merge(SCC, NEI, by.x = "SCC", by.y = "SCC")
x <- grep("Vehicle", mrg$EI.Sector)
V <- mrg[x, ]
V1 <- select(V, fips:year)
V2 <- subset(V1, fips == "24510")

# Open "png" graphics device
png(filename = "plot5.png", width = 480, height = 480, units = "px")

g <- ggplot(V2, aes(factor(year), Emissions)) + geom_boxplot() + 
    ylim(0, 5) + xlab("Year") + ylab("PM2.5 Emissions, Tons") +
    ggtitle("Baltimore: PM2.5 Vehicle Emissions Trend") +
    geom_smooth(method = "lm", se=FALSE, color="green", aes(group=1)) 
print(g)

dev.off()
