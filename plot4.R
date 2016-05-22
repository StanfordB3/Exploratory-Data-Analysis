 ## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#4.  Across the United States, how have emissions from coal combustion-related 
    ## sources changed from 1999–2008?
library(dplyr)
mrg <- merge(SCC, NEI, by.x = "SCC", by.y = "SCC")
x <- grep("Coal", mrg$EI.Sector)
Coal <- mrg[x, ]
Coal1 <- select(Coal, fips:year)


# Open "png" graphics device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

g <- ggplot(Coal1, aes(factor(year), log10(Emissions))) + geom_boxplot() + 
   xlab("Year") + ylab("log10(PM2.5 Emissions, Tons)") +
    ggtitle("Baltimore: PM2.5 Combustible Coal Emissions Trend") +
    geom_smooth(method = "lm", se=FALSE, color="green", aes(group=1)) 
print(g)

dev.off()