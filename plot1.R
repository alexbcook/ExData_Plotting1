## This script imports the power consumption data located at 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## puts it in your wd, unzips, reads it into R, reformats it, then plots the data per Course Assignment 1

if (!file.exists("ExData_Plotting1")) {
    dir.create("ExData_Plotting1")
}

## Download & read file into R
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","uci.zip",method="curl")
unzip("uci.zip")
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE,header=TRUE)

## Limit to 2 specific days
data<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

##data$Date<-as.Date(data$Date,"%d/%m/%Y")        ## convert Date to date format

## Make Plot 1
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main=paste("Global Active Power"))
dev.copy(png,file="plot1.png")
dev.off()