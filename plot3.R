# load the data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header=T, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
power <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))
power <- transform(power, wday=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# generate Plot 3
plot(power$wday,power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power$wday,power$Sub_metering_2,col="red")
lines(power$wday,power$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()