HH_elect<-read.table("~/Documents/Learning_R/Coursera/Data_Exploration/Assignment/hh_power_consumption.txt",sep=';',header=T)
date1<-subset(HH_elect, Date=="1/2/2007")
date2<-subset(HH_elect, Date=="2/2/2007")
elect_data<-rbind(date1,date2)

# converting Date variable from character to date format
elect_data$Date<-as.Date(elect_data$Date,"%d/%m/%Y")
class(elect_data$Date)

## adding the weekday variable
elect_data$Weekday<-weekdays(elect_data$Date,abbreviate=F)
elect_data<-elect_data[ ,c('Date','Time','Weekday','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')]

elect_data$Global_active_power<-as.numeric(elect_data$Global_active_power)
elect_data$Global_reactive_power<-as.numeric(elect_data$Global_reactive_power)
elect_data$Voltage<-as.numeric(elect_data$Voltage)
elect_data$Global_intensity<-as.numeric(elect_data$Global_intensity)
elect_data$Sub_metering_1<-as.numeric(elect_data$Sub_metering_1)
elect_data$Sub_metering_2<-as.numeric(elect_data$Sub_metering_2)
elect_data$Sub_metering_3<-as.numeric(elect_data$Sub_metering_3)
head(elect_data)


summary(elect_data$Global_active_power,na.rm=T)
fivenum(elect_data$Global_active_power,na.rm=T)

library(dplyr)

# PLOT-1
hist(elect_data$Global_active_power,xlab="Global Actie Power(kilowatts)",col="red", main="Global Active Power")
dev.copy(png, file="~/Documents/Learning_R/Coursera/Data_Exploration/Assignment/Plot_1.png") #Copy plot to a png file 
dev.off()

## PLOT-2
date_2=elect_data[ ,c('Weekday','Global_active_power')]

elect_data$newdate <- with(elect_data, as.POSIXct(paste(Date, Time), format="%m-%d-%Y %H:%M"))
plot(Global_active_power ~ newdate, data=elect_data, type="b", col="blue")

head(elect_data)

with(date,lines(Weekday,Global_active_power,Weekday),na.rm=T)

plot(date$Weekday,date$Global_active_power, type='l',col='red')

line(Global_active_power~Weekday, data=date, xlab='Weekday', ylab='Global Active Power (kilowatts)',
        names=c("Thursday","Friday"))



hist(date$Voltage,col="red")

date2<-date[complete.cases(date)]

