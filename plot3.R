#Explorary data analysis project 1 -- Plot 3
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

#plot 3
png("Plot3.png", width=480,height=480)
#initalizing and ploting the first category
plot(twoDays$DateTime,twoDays$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
#adding the remaining two on top of the initial one using the lines() function points() could as well be used
lines(twoDays$DateTime, twoDays$Sub_metering_2, type = "l", col = "red")
lines(twoDays$DateTime, twoDays$Sub_metering_3, type = "l", col = "blue")
#adding the legend
legend("topright", legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), lty=c(1,1), col=c("Black", "Red","Blue"))
dev.off()