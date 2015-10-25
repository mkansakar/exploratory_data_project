library(plyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#grep("Coal",SCC$EI.Sector,ignore.case=T)
coal <- SCC[grepl("Coal", SCC$Short.Name,ignore.case = T),]

coal_dt <- NEI[NEI$SCC %in% coal$SCC,]

totalbyYear <- ddply(coal_dt, .(year), function(x) sum(x$Emissions))

png("explo_plot4.png")
qplot(year, V1, data = totalbyYear,
      xlab   = "Year",
      ylab   = "Total Emissions (tons)",
      geom   = "line")
dev.off()
