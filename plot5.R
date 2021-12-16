### 5. How have emissions from motor vehicle sources changed from 1999–2008 in
### Baltimore City?


# Load needed packages

library(dplyr)
library(ggplot2)

balt_emissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]

balt_emissions_year <- summarise(group_by(balt_emissions, year), 
                                 Emissions=sum(Emissions))

ggplot(balt_emissions_year, aes(x=factor(year), y=Emissions,fill=year,
                                label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions in Tons")) +
  ggtitle("Emissions From Motor Vehicle Sources in Baltimore City")+
  geom_label(aes(fill = year),col = "white", fontface = "bold")