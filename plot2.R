### 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
### (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? 
### Use the base plotting system to make a plot answering this question.



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

#Plot 2

balt.emissions<-summarise(group_by(filter(NEI, fips == "24510"), year),
                                  Emissions=sum(Emissions))
clrs <- c("red", "green", "blue", "yellow")
x2<-barplot(height=balt.emissions$Emissions/1000, names.arg=balt.emissions$year,
            xlab="years", ylab=expression('Total PM'[2.5]*' Emission in Kilotons'),ylim=c(0,4),
            main=expression('Total PM'[2.5]*' Emissions in Baltimore City MD in Kilotons'),col=clrs)


text(x = x2, y = round(balt.emissions$Emissions/1000,2),
     label = round(balt.emissions$Emissions/1000,2), pos = 3,
     cex = 0.8, col = "black")