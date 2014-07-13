# Author: Juan Carlos Guzman
# Exploratory Data Analysis
# homework #1 -- Plot #2

#setwd("C:/Users/Juan Carlos/Desktop/ExpDataAnalysis")

df1 <- read.csv2("household_power_consumption.txt", header = T, dec = ".", comment.char = "?")
df1$Time = strptime(paste(df1$Date,df1$Time),format="%d/%m/%Y %H:%M:%S")
df1$Date = as.Date(df1$Date,format="%d/%m/%Y")
df = subset(df1, Date >= '2007-02-01' & Date <= '2007-02-02')

#Plot 2
with(df, plot(Time, Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, 'plot2.png')
dev.off()
