# load the data files
# there are 11,717 rows & 15 columns
source_data<-readRDS(file="C:/Users/SKTelecom/Desktop/python/R studio/4. exploratory data analysis/week4/Source_Classification_Code.rds")

# there are 6,497,651 rows & 6 columns
pm25_data<-readRDS(file="C:/Users/SKTelecom/Desktop/python/R studio/4. exploratory data analysis/week4/summarySCC_PM25.rds")

# make new data frame, "result"
# compose "year" and "total Emissions"
year<-unique(pm25_data$year)
result<-data.frame(year,"Emissions"=c(0,0,0,0))

# calculate sum of each year
# only in Baltimore city, Maryland
for(i in 1:nrow(result)){
  result[i,2]<-sum(pm25_data$Emissions[pm25_data$year==result[i,1]&pm25_data$fips==24510])
}

# draw a graph
png("plot2.png")

plot(result[,1],result[,2],type="l",
     main="Total PM2.5 emission in Baltimore,Maryland",xlab="Year",ylab="Total emission")
points(result[,1],result[,2],pch=16,col="red")

dev.off()
