## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# 1.  Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
## for each of the years 1999, 2002, 2005, and 2008.
# Trend in emissions:

E2008 = subset(NEI, year="2008")
png(filename = "plot1.png", width = 480, height = 480, units = "px")

par(mfrow=c(1,1), mar=c(4,4,2, 1))
boxplot(log10(Emissions) ~ year, data = NEI, col = "green", ylim=c(-4, 5), xlab="Year", ylab="Total PM2.5 Emissions, Tons")
abline(h = log10(median(E2008$Emissions)), col="red", lwd =2)
title("Trend in Overall Emission of PM2.5 in USA from 1999-2008, Tons")
legend("topright", lty = c(1), col = c("red"), legend=c("Median 2008"))

dev.off()