## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

#2.  Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

NEIB  <- subset(NEI, fips == "24510")
E2008  <- subset(NEI, year == 2008 & fips == "24510")

png(filename = "plot2.png", width = 480, height = 480, units = "px")

par(mfrow=c(1,1), mar=c(4,4,2, 1))

boxplot(log10(Emissions) ~ year, data = NEIB, col = "green",  xlab="Year", ylab="Total PM2.4 Emissions, Tons")
abline(h = log10(median(E2008$Emissions)), col="red", lwd =2)
title("Baltimore: Trend in Overall Emission of PM2.5 from 1999-2008, Tons")
legend("topright", lty = c(1), col = c("red"), legend=c("2008 Median"))
dev.off()

