NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#sum the PM2.5 by years. 
totalbyYear <- tapply(NEI$Emissions, NEI$year, sum)

png("explo_plot1.png")
barplot(totalbyYear,xlab="Year",ylab = "Emissions PM2.5 (tons)", main="Total PM2.5 Emissions in US over the years")
dev.off()

