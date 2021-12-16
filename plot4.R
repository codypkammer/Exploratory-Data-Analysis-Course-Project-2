### 4. Across the United States, how have emissions from coal combustion-related 
### sources changed from 1999–2008?

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


# Plot 4

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