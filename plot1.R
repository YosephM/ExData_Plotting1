#Explorary data analysis project 1 -- Plot 1

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

#plot 1
par(mfrow=c(1,1))
#windows.options(width=480,height=480)
png("Plot1.png", width=480,height=480)
hist(twoDays$Global_active_power,col="red", main="Global Active Power" ,xlab="Global Active Power(Kilowatts)",ylab="Frequency")
dev.off()