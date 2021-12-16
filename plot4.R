### 4. Across the United States, how have emissions from coal combustion-related 
### sources changed from 1999–2008?

# Load needed packages dplyr & ggplot2

library(dplyr)
library(ggplot2)

combustion_coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion_coal_sources <- SCC[combustion_coal,]


emissions_coal_combustion <- NEI[(NEI$SCC %in% combustion_coal_sources$SCC), ]

emissions_coal_related <- summarise(group_by(emissions_coal_combustion, year),
                                    Emissions=sum(Emissions))

ggplot(emissions_coal_related, aes(x=factor(year), y=Emissions/1000,fill=year,
                                   label = round(Emissions/1000,2))) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("Total PM"[2.5]*" Emissions in Kilotons")) +
  ggtitle("Emissions From Coal Combustion Related Sources in Kilotons")+
  geom_label(aes(fill = year),col = "white", fontface = "bold")