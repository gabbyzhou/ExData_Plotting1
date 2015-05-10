# load the data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header=T, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
power <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

# generate Plot 1
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
hist(power$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
