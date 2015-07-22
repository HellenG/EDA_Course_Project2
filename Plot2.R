#******************************************************************************
#Question 2:Status of Baltimore City
#-----------------------------------
#2(a) Graphical Presentation of the trend
if(file.exists("nei.zip") == FALSE){
    link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(link, "nei.zip")
    unzip("nei.zip")
}

#Reading in data 
NEI <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")    
NEI$year.fact <- factor(NEI$year)
#Subsetting to the required data
bcm <- NEI[NEI$fips == "24510", ]

png("plot2.png")
boxplot(log(bcm$Emissions)~bcm$year.fact, col = sample(colors(), length(levels(bcm$year.fact))))
dev.off()
file.show("plot2.png")
#**********  Conclusion  ***********************************
#It quite evident that emission in Baltimore City has declined. However, there was a significant increase in during the 2005 period
#*********     End       **********************************