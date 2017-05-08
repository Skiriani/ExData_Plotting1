#Creating Plot 3 for Week 1 of Exploratory data analysis assignment

#clean workspace
rm(list=ls())

#set working directory
setwd("C:\\Rdata\\Coursera")

#read in data
dat<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE)
dat$date<-as.Date(dat$Date, format="%d/%m/%Y") 

#subset dates needed
date1<-as.Date("2007-02-01")
date2<-as.Date("2007-02-02")

dat2<-subset(dat, dat$date>=date1 & dat$date<=date2)

dat2$DateTime<-as.POSIXct(paste(dat2$date, dat2$Time), format="%Y-%m-%d %H:%M:%S")

#plot 3
png("plot3.png", 480, 480)
with(dat2,{
        plot(DateTime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
        lines(DateTime,Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", col="red")
        lines(DateTime,Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", col="blue")
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
})
dev.off()