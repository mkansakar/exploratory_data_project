library(plyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips=="24510" & NEI$type == "ON-ROAD",]

b_totalbyYear_motor <- ddply(baltimore, .(year), function(x) sum(x$Emissions))
#names(b_totalbyYear_motor)

png("explo_plot5.png")
qplot(year, V1, data=b_totalbyYear_motor,
      geom="line",
      xlab="Year",
      ylab="Total PM2.5 Emissions"
)
dev.off()