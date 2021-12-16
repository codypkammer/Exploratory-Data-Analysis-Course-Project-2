### 5. How have emissions from motor vehicle sources changed from 1999–2008 in
### Baltimore City?

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


# Plot 5

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