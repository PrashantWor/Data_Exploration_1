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


## PLOT-2

# converting Date variable from character to date format
elect_data$Date<-as.Date(elect_data$Date,"%d/%m/%Y")
class(elect_data$Date)

## converting Time variable to class Time
install.packages("hms")
library(hms)
elect_data$Time<-as_hms(elect_data$Time)
typeof(elect_data$Time)
class(elect_data$Time)

## Now we can Plot-2
#first combine date and time into one date_time variable
elect_data$date_time <- with(elect_data, as.POSIXct(paste(elect_data$Date, elect_data$Time), format="%Y-%m-%d %H:%M:%S"))
with(elect_data, plot(date_time, Global_active_power,  ylab= "Global active power (kilowatts)", type='l'))
dev.copy(png, file="~/Documents/Learning_R/Coursera/Data_Exploration/Assignment/Plot_2.png") #Copy plot to a png file 
dev.off()