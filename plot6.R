### 6. Compare emissions from motor vehicle sources in Baltimore City with emissions
### from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|
### fips == "06037"|}fips == "06037"). Which city has seen greater changes over 
### time in motor vehicle emissions?

# Load needed packages

library(dplyr)
library(ggplot2)


# Plot 6

balt_emissions<-summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD'),
                                   year), Emissions=sum(Emissions))
LA_emissions<-summarise(group_by(filter(NEI, fips == "06037"& type == 'ON-ROAD'),
                                 year), Emissions=sum(Emissions))

balt_emissions$County <- "Baltimore City, MD"
LA_emissions$County <- "Los Angeles County, CA"
both_emissions <- rbind(balt_emissions, LA_emissions)

require(ggplot2)
ggplot(both_emissions, aes(x=factor(year), y=Emissions, fill=County,
                           label = round(Emissions,2))) +
  geom_bar(stat="identity") + 
  facet_grid(County~., scales="free") +
  ylab(expression("Total PM"[2.5]*" Emissions in Tons")) + 
  xlab("year") +
  ggtitle(expression("Motor Vehicle Emission Variation in Baltimore and Los Angeles in ons"))+
  geom_label(aes(fill = County),col = "white", fontface = "bold")