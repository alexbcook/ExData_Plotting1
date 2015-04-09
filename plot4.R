## This script imports the power consumption data located at 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## puts it in your wd, unzips, reads it into R, reformats it, then plots the data per Course Assignment 1

if (!file.exists("ExData_Plotting1")) {
    dir.create("ExData_Plotting1")
}
setwd("ExData_Plotting1")

## Download & read file into R
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","uci.zip",method="curl")
unzip("uci.zip")
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE,header=TRUE)

## Limit to 2 specific days
data<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

library(lubridate)
data$Datetime<-dmy_hms(paste(data$Date,data$Time))

## Make Plot 4
par(mfrow=c(2,2))
with(data,{
    plot(data$Datetime,data$Global_active_power,type="n",xlab="",ylab="Global Active Power")
    lines(data$Datetime,data$Global_active_power)
    plot(data$Datetime,data$Voltage,type="n",xlab="datetime",ylab="Voltage")     
    lines(data$Datetime,data$Voltage)
    plot(data$Datetime,data$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering")
    lines(data$Datetime,data$Sub_metering_1)
    lines(data$Datetime,data$Sub_metering_2,col="red")
    lines(data$Datetime,data$Sub_metering_3,col="blue")
    legend("topright",cex=.5,bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(data$Datetime,data$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
    lines(data$Datetime,data$Global_reactive_power)
})

dev.copy(png,file="plot4.png")
dev.off()