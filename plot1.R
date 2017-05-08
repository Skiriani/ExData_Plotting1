#Creating Plot 1 for Week 1 of Exploratory data analysis assignment

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

#plot 1
dat2$Global_active_power<-as.numeric(dat2$Global_active_power)
png("plot1.png", 480, 480)
hist(dat2$Global_active_power, col = "red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
