HH_elect<-read.table("~/Documents/Learning_R/Coursera/Data_Exploration/Assignment/hh_power_consumption.txt",sep=';',header=T)
date1<-subset(HH_elect, Date=="1/2/2007")
date2<-subset(HH_elect, Date=="2/2/2007")
elect_data<-rbind(date1,date2)

# converting variables from character to numeric 
elect_data$Global_active_power<-as.numeric(elect_data$Global_active_power)
elect_data$Global_reactive_power<-as.numeric(elect_data$Global_reactive_power)
elect_data$Voltage<-as.numeric(elect_data$Voltage)
elect_data$Global_intensity<-as.numeric(elect_data$Global_intensity)
elect_data$Sub_metering_1<-as.numeric(elect_data$Sub_metering_1)
elect_data$Sub_metering_2<-as.numeric(elect_data$Sub_metering_2)
elect_data$Sub_metering_3<-as.numeric(elect_data$Sub_metering_3)

# converting Date variable from character to date format
elect_data$Date<-as.Date(elect_data$Date,"%d/%m/%Y")
class(elect_data$Date)

## converting Time variable to class Time
install.packages("hms")
library(hms)
elect_data$Time<-as_hms(elect_data$Time)
typeof(elect_data$Time)
class(elect_data$Time)

#first combine date and time into one date_time variable
elect_data$date_time <- with(elect_data, as.POSIXct(paste(elect_data$Date, elect_data$Time), format="%Y-%m-%d %H:%M:%S"))

## Plot 4
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(elect_data$date_time, elect_data$Global_active_power, xlab="", ylab="Global Active Power",type='l',lty=1, lwd=1)
plot(elect_data$date_time, elect_data$Voltage, xlab = "Datetime", ylab="Voltage",type='l',lty=1, lwd=1)
plot(elect_data$date_time, elect_data$Sub_metering_1, xlab="", ylab= "Energy sub metering", type='l',lty=1, lwd=1)
points(elect_data$date_time, elect_data$Sub_metering_2, col="blue",type='l',lty=1, lwd=1)
points(elect_data$date_time, elect_data$Sub_metering_3, col="red",type='l',lty=1, lwd=1)
plot(elect_data$date_time, elect_data$Global_reactive_power, xlab = "Datetime", ylab="Global_reactive_power", type='l',lty=1, lwd=1)
#Copy of plot-4 to a png file
dev.copy(png, file="~/Documents/Learning_R/Coursera/Data_Exploration/Assignment/Plot_4.png") 
dev.off()                        
