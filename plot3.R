### 3. Of the four types of sources indicated by the \color{red}{\verb|type|}type
### (point, nonpoint, onroad, nonroad) variable, which of these four sources have
### seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen
### increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
### a plot answer this question.



# Set working directory 
setwd("G:/R/Exploratory Data Analysis/course project 2/Exploratory-Data-Analysis-Course-Project-2")


# Bringing in data
data_project_files <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip" 

download.file(data_project_files,destfile=".data.zip",method="auto")  

unzip(zipfile=".data.zip",exdir="./data")

NEI <- readRDS("data/summarySCC_PM25.rds")

SCC <- readRDS("data/Source_Classification_Code.rds")

# Load Required package 

library(dplyr)
library(ggplot2)

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