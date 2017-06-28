# load the data files
# there are 11,717 rows & 15 columns
source_data<-readRDS(file="C:/Users/SKTelecom/Desktop/python/R studio/4. exploratory data analysis/week4/Source_Classification_Code.rds")

# there are 6,497,651 rows & 6 columns
pm25_data<-readRDS(file="C:/Users/SKTelecom/Desktop/python/R studio/4. exploratory data analysis/week4/summarySCC_PM25.rds")

# extract fips=24510, Baltimore city
# extract type="on-road"
pm_data<-pm25_data[(pm25_data$fips=="24510")&(pm25_data$type=="ON-ROAD"),]

# summarize the file using aggregate function
new2_pm25_data<-aggregate(Emissions~year,pm_data,sum)

# draw a graph
png("plot5.png")
plot(new2_pm25_data[,1],new2_pm25_data[,2],type="l",
     main="Total motor vehicle emission",xlab="Year",ylab="Total emission")
points(new2_pm25_data[,1],new2_pm25_data[,2],pch=16,col="red")

dev.off()
