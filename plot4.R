# load the data files
# there are 11,717 rows & 15 columns
source_data<-readRDS(file="C:/Users/SKTelecom/Desktop/python/R studio/4. exploratory data analysis/week4/Source_Classification_Code.rds")

# there are 6,497,651 rows & 6 columns
pm25_data<-readRDS(file="C:/Users/SKTelecom/Desktop/python/R studio/4. exploratory data analysis/week4/summarySCC_PM25.rds")

# extract coal related sources in "source_data"
# match SCC number
coal_related_row_num<-grep("coal",source_data$EI.Sector,ignore.case=TRUE)
coal_related<-source_data[coal_related_row_num,1]

# extract coal related data from "pm25_data"
# "coal_pm25_data" variable is only related with coal
coal_pm25_data<-pm25_data[pm25_data$SCC%in%coal_related,]

# summarize the file using aggregate function
new_pm25_data<-aggregate(Emissions~year,coal_pm25_data,sum)

# draw a graph
png("plot4.png")
plot(new_pm25_data[,1],new_pm25_data[,2],type="l",
     main="Total coal related emission",xlab="Year",ylab="Total emission")
points(new_pm25_data[,1],new_pm25_data[,2],pch=16,col="red")

dev.off()
