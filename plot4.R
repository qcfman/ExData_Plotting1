# Author: Juan Carlos Guzman
# Exploratory Data Analysis
# homework #1 -- Plot #4

#setwd("C:/Users/Juan Carlos/Desktop/ExpDataAnalysis")

df1 <- read.csv2("household_power_consumption.txt", header = T, dec = ".", comment.char = "?")
df1$Time = strptime(paste(df1$Date,df1$Time),format="%d/%m/%Y %H:%M:%S")
df1$Date = as.Date(df1$Date,format="%d/%m/%Y")
df = subset(df1, Date >= '2007-02-01' & Date <= '2007-02-02')

#Plot 4
par(mfrow= c(2, 2))
#Graph 4a
with(df, plot(Time, Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)", xlab = ""))
#Graph 4b
with(df, plot(Time, Voltage, type = "l",ylab = "Voltage", xlab = "datetime"))
#Graph 4c
with(df, plot(Time, Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab = ""))
with(df, lines(Time,Sub_metering_2,col="red"))
with(df, lines(Time,Sub_metering_3,col="blue"))
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , 
   lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)
#Graph 4d
with(df, plot(Time, Global_reactive_power, type = "l",ylab = "Global_reactive_power", xlab = "datetime"))
dev.copy(png, 'plot4.png')
dev.off()
