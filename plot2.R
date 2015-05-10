# load the data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header=T, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
power <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
power$Global_reactive_power <- as.numeric(as.character(power$Global_reactive_power))
power <- transform(power, wday=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# generate Plot 2
plot(power$wday,power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()