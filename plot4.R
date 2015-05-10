# load the data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header=T, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
power <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
power$Global_reactive_power <- as.numeric(as.character(power$Global_reactive_power))
power$Voltage <- as.numeric(as.character(power$Voltage))
power <- transform(power, wday=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# generate Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
# subplot 1
plot(power$wday,power$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# subplot 2
plot(power$wday,power$Voltage, type="l", xlab="datetime", ylab="Voltage")
# subplot 3
plot(power$wday,power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power$wday,power$Sub_metering_2,col="red")
lines(power$wday,power$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
# subplot 4
plot(power$wday,power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()