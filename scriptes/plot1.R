#download and read data
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="les1.zip")
unzip("les1.zip",  overwrite=TRUE)
data<-read.table("household_power_consumption.txt", header=TRUE,sep=";", na.string="?")

#filter the need data
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

#open device
png(filename="plot1.png", width=480, heigh=480, units="px")

#create plot
hist(data$Global_active_power, main="Global_active_power",xlab="Global Active Power (kilowatts)",col="red")

#close device
x<-dev.off()
