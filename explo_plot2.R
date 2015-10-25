NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips=="24510",]
b_totalbyYear <- tapply(baltimore$Emissions,baltimore$year,sum)

png("explo_plot2.png")
barplot(b_totalbyYear,xlab="Year",ylab = "Emissions PM2.5 (tons)", main="Total PM2.5 Emissions in Baltimore City")
dev.off()
