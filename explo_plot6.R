library(plyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore_NY <- NEI[(NEI$fips=="24510" |NEI$fips == "06037" ) & NEI$type == "ON-ROAD",]

totalbyYear_motor <- ddply(baltimore_NY, .(year,fips), function(x) sum(x$Emissions))
totalbyYear_motor$city <- ifelse(totalbyYear_motor$fips == "24510", "Baltimore", "Los Angeles")
#names(totalbyYear_motor)

png("explo_plot6.png")
qplot(year, V1, data=totalbyYear_motor,
      color=city, 
      geom="line",
      xlab="Year",
      ylab="Total PM2.5 Emissions"
)
dev.off()