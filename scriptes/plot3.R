library(data.table)
library(lubridate)
Sys.setlocale("LC_TIME", "English")

#download and read data
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="les1.zip")
unzip("les1.zip",  overwrite=TRUE)
data<-read.table("household_power_consumption.txt", header=TRUE,sep=";", na.string="?")

#filter the need data
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

#convert Date and Time to new variable
data$DateTime<-dmy(data$Date)+hms(data$Time)

#open device
png(filename="plot3.png", width=480, heigh=480, units="px")

#create plot for 3 variable
plot(data$DateTime, data$Sub_metering_1, ylab="Energy Sub metering", xlab="", type="l")
lines(data$DateTime, data$Sub_metering_2, col="red", type="l")
lines(data$DateTime, data$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , col=c("black", "red", "blue"), lty="solid")

#close device
x<-dev.off()
