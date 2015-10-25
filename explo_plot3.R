library(plyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips=="24510",]
#head(baltimore)
b_totalbyYear_type <- ddply(baltimore, .(year,type), function(x) sum(x$Emissions))
#names(b_totalbyYear_type)

png("explo_plot3.png")
qplot(year, V1, data=b_totalbyYear_type,
      color=type, 
      geom="line",
      xlab="Year",
      ylab="Total PM2.5 Emissions"
      )
dev.off()