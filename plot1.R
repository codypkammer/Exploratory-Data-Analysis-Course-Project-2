### 1. Have total emissions from PM2.5 decreased in the United States from 1999
### to 2008? Using the base plotting system, make a plot showing the total PM2.5
### emission from all sources for each of the years 1999, 2002, 2005, and 2008.


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

#Plot 1

total.emissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))
clrs <- c("red", "green", "blue", "yellow")
x1<-barplot(height=total.emissions$Emissions/1000, names.arg=total.emissions$year,
            xlab="years", ylab=expression('Total PM'[2.5]*' Emission in Kilotons'),
            ylim=c(0,8000),
            main=expression('Total PM'[2.5]*'Emissions at Various Years in Kilotons'),
            col=clrs)

text(x = x1, y = round(total.emissions$Emissions/1000,2),
     label = round(total.emissions$Emissions/1000,2), 
     pos = 3, cex = 0.8, col = "black")





