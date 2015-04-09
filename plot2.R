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

## Make Plot 2
plot(data$Datetime,data$Global_active_power, type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(data$Datetime,data$Global_active_power)

dev.copy(png,file="plot2.png")
dev.off()