### 3. Of the four types of sources indicated by the \color{red}{\verb|type|}type
### (point, nonpoint, onroad, nonroad) variable, which of these four sources have
### seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen
### increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
### a plot answer this question.

# Load needed packages ggplot2 and dplyr

library(ggplot2)
library(dplyr)

# Plot 3

balt.emissions.year<-summarise(group_by(filter(NEI, fips == "24510"),
                                          year,type), Emissions=sum(Emissions))

ggplot(balt.emissions.year, aes(x=factor(year), y=Emissions, fill=type,
                                          label = round(Emissions,2))) +
  geom_bar(stat="identity") +
 
  facet_grid(. ~ type) +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emission in Tons")) +
  ggtitle(expression("PM"[2.5]*paste("Emissions in Baltimore ",
                                     "City By Various Source Types", sep="")))+
  geom_label(aes(fill = type), col = "white", fontface = "bold")