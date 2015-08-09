# Exploratory Data Analysis
# A course in the Data Science track offered by Johns Hopkins University through Coursera
# August, 2015
# Project 1 (Week 1)
# The project is described in the following GitHub repository: 
# https://github.com/rdpeng/ExData_Plotting1
#
# We will use data from the UC Irvine Machine Learning Repository,
# a popular repository for machine learning datasets. In particular, we will be using the
# "Individual household electric power consumption Data Set"
# Here is a link to the data set:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
# Make four plots specified in the project description, using the base plotting package.
# Name each of the plot files as plot1.png, plot2.png, etc
#setwd("C:/Users/Bill/Desktop/ImportantPlaces/CourseraJohnsHopkinsDataScientistSeriesClasses/ExData_Plotting1")
#
# Convet while reading in so we don't need to take up more memory
# by converting later.  The following vector specifies conversion type for non-numerics.
#conversions<-c(strptime(x,format="%d/%m/%Y"),strptime(x,format="%H:%M:%S"))
power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,
                  na.strings="?",stringsAsFactors=FALSE)
p2<-power$Date=="2/2/2007" | power$Date=="1/2/2007"
p3<-power[p2, 1:9]
# We have the subset that we need so free up the memory used by the unneeded data
remove(power)
remove(p2)
#
# Plot1
png(file="plot1.png")
hist(p3$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")
axis(side=2,at=c(0,200,400,600,800,100,1200))
dev.off()
#
# Plot2
# First create a column of dates and times that R can work with
p3$DT<-strptime(paste(p3$Date,p3$Time), "%d/%m/%Y %H:%M:%S")
#
# Draw the plot with lines connectig the data points
png(file="plot2.png")
plot(y=p3$Global_active_power,x=p3$DT,main="",xlab="",
     ylab="Global Active Power (kilowatts)",pch=".",type="l")
dev.off()
#
# Plot 3
png(file="plot3.png")
plot(y=p3$Sub_metering_1,x=p3$DT,main="",xlab="",
     ylab="Energy sum metering",pch=".",type="l")
points(y=p3$Sub_metering_2,x=p3$DT,main="",
     pch=".",type="l",col="red")
points(y=p3$Sub_metering_3,x=p3$DT,main="",
       pch=".",type="l",col="blue")
legend("topright",pch="-",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
#
# Plot 4 has four parts
# They are in a 2-by-2 configuration
png(file="plot4.png")
par(mfrow=c(2,2), mar=c(4,4,1,2))
# plot 4.1 Global Active Power
plot(y=p3$Global_active_power,x=p3$DT,main="",xlab="",
     ylab="Global Active Power",pch=".",type="l")
#
# plot 4.2 Voltage
plot(y=p3$Voltage,x=p3$DT,main="",xlab="datetime",
     ylab="Voltage",pch=".",type="l")
#
# plot 4.3 Sub metering
plot(y=p3$Sub_metering_1,x=p3$DT,main="",xlab="",
     ylab="Energy sum metering",pch=".",type="l")
points(y=p3$Sub_metering_2,x=p3$DT,main="",
       pch=".",type="l",col="red")
points(y=p3$Sub_metering_3,x=p3$DT,main="",
       pch=".",type="l",col="blue")
legend("topright",pch="-",col=c("black","red","blue"),bty="n", text.width=90000,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#
# plot 4.4 Global_reactive_power
plot(y=p3$Global_reactive_power,x=p3$DT,main="",xlab="datetime",
     ylab="Global_reactive_power",pch=".",type="l")
dev.off()
