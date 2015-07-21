#Question 1: Status of total emission from PM2.5 
#------------------------------------------------
#Graphical presentation
if(file.exists("nei.zip") == FALSE){
    link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(link, "nei.zip")
    unzip("nei.zip")
}

#Reading in data 
NEI <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")    
NEI$year.fact <- factor(NEI$year)

png("plot1.png")
#A dotchart: To show the averages
Medians <- with(NEI, by(NEI, year.fact, function(x) median(x$Emissions)))
m <- Medians[1:length(Medians)]
dimnames(m) <- NULL
df <- data.frame(year = levels(factor(NEI$year)), medians = m)
with(df, plot(x = medians, y = year, type = "n", xlim = c(0, 0.04)))
with(df, points(x = medians, y = year, pch = 8))
for(i in 1:4){
segments(x0 = 0, y0 = i, x1 = df$medians[i], y1 = i, lty = 2, col = rainbow(1))
}
text(x = 0.037, y = 1.3, labels = c("1999"))

dev.off()
file.show("plot1.png")
df
# ***********  Conclusion *****************
#From both graphs, it is clear that total emission is on the decline
#************    END      *****************             