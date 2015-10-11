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
png(filename="plot4.png", width=480, heigh=480, units="px")

#create 4 plots
par(mfrow=c(2,2))

plot(data$DateTime, data$Global_active_power, ylab="Global Active Power", xlab="", type="l")
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="DateTime", type="l")

plot(data$DateTime, data$Sub_metering_1, ylab="Energy Sub metering", xlab="", type="l")
lines(data$DateTime, data$Sub_metering_2, col="red", type="l")
lines(data$DateTime, data$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , col=c("black", "red", "blue"), lty="solid")

plot(data$DateTime, data$Global_reactive_power, ylab="Global reactive power", xlab="DateTime", type="l")

#close device
x<-dev.off()
