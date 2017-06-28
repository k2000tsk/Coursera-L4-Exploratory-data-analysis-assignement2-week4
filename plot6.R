library(ggplot2)

# load the data files
# there are 11,717 rows & 15 columns
source_data<-readRDS(file="C:/Users/SKTelecom/Desktop/python/R studio/4. exploratory data analysis/week4/Source_Classification_Code.rds")

# there are 6,497,651 rows & 6 columns
pm25_data<-readRDS(file="C:/Users/SKTelecom/Desktop/python/R studio/4. exploratory data analysis/week4/summarySCC_PM25.rds")

# extract fips=24510 , Baltimore city & fips=06037, Los Angeles
# extract type = "ON-ROAD"
pm_data<-pm25_data[(pm25_data$fips=="24510")|(pm25_data$fips=="06037"),]
pm_data<-pm_data[pm_data$type=="ON-ROAD",]

# use aggregate function, store new variable "new_pm_data"
new3_pm_data<-aggregate(Emissions~year+fips,pm_data,sum)

# change fips number to city name
city<-c(1:8)
new3_pm_data<-cbind(new3_pm_data,city)
new3_pm_data$city[new3_pm_data$fips=="24510"]<-"Baltimore"
new3_pm_data$city[new3_pm_data$fips=="06037"]<-"Los Angeles"

# draw a graph
png("plot6.png")

g<-ggplot(new3_pm_data,aes(year,Emissions,color=city))
g<-g+geom_line()+labs(title="Total Emissions comparing Baltimore & LA",x="Year",y="Total Emissions")
g

dev.off()
