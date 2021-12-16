### 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
### (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? 
### Use the base plotting system to make a plot answering this question.

balt.emissions<-summarise(group_by(filter(NEI, fips == "24510"), year),
                                  Emissions=sum(Emissions))
clrs <- c("red", "green", "blue", "yellow")
x2<-barplot(height=balt.emissions$Emissions/1000, names.arg=balt.emissions$year,
            xlab="years", ylab=expression('Total PM'[2.5]*' Emission in Kilotons'),ylim=c(0,4),
            main=expression('Total PM'[2.5]*' Emissions in Baltimore City MD in Kilotons'),col=clrs)


text(x = x2, y = round(balt.emissions$Emissions/1000,2),
     label = round(balt.emissions$Emissions/1000,2), pos = 3,
     cex = 0.8, col = "black")