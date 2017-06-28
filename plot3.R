library(ggplot2)

# load the data files
# there are 11,717 rows & 15 columns
source_data<-readRDS(file="C:/Users/SKTelecom/Desktop/python/R studio/4. exploratory data analysis/week4/Source_Classification_Code.rds")

# there are 6,497,651 rows & 6 columns
pm25_data<-readRDS(file="C:/Users/SKTelecom/Desktop/python/R studio/4. exploratory data analysis/week4/summarySCC_PM25.rds")

# extract fips=24510, Baltimore city
pm_data<-pm25_data[pm25_data$fips=="24510",]

# use aggregate function, store new variable "new_pm_data"
new_pm_data<-aggregate(Emissions~year+type,pm_data,sum)

# draw a graph
png("plot3.png")

g<-ggplot(new_pm_data,aes(year,Emissions,color=type))
g<-g+geom_line()
g+labs(title="Total Emissions of 4 types in Baltimore City",x="Year",y="Total Emissions")


dev.off()
