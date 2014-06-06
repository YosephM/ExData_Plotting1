#Explorary data analysis project 1 -- Plot 4
#data managment Section ----------------------------------------------------
setwd("D:/Trainings/R/xData_Plotting1")
dataCSV<-read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";" ,na.strings="?")

nrow(dataCSV) #2,075,259
ncol(dataCSV) # 9

#selecting only 2007-0-01 and 2007-0-02
twoDays<-dataCSV[as.Date(dataCSV$Date,"%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]

#checking filtered data
head(twoDays)
tail(twoDays)
nrow(twoDays)

#conver date and Time variables to approprate formats
twoDays$Date <- as.Date(twoDays$Date, format = "%d/%m/%Y")
twoDays$DateTime <- strptime(paste(twoDays$Date, twoDays$Time), format = "%Y-%m-%d %H:%M:%S")


#---------------------------------------------------------------
png("Plot4.png", width=480,height=480)
par(mfrow = c(2, 2))

plot(twoDays$DateTime, twoDays$Global_active_power,type = "l",ylab = "Global Active Power", xlab = "")

plot(twoDays$DateTime, twoDays$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(twoDays$DateTime, twoDays$Sub_metering_1,type = "l", ylab = "Energy sub metering",  xlab = "")
lines(twoDays$DateTime, twoDays$Sub_metering_2, type = "l", col = "red")
lines(twoDays$DateTime, twoDays$Sub_metering_3, type = "l", col = "blue")

legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

plot(twoDays$DateTime, twoDays$Global_reactive_power,type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()