# Data Science: Exploratory Data Analysis
# Course Project 1
# plot4.R

rm(list = ls())

file = "household_power_consumption.txt"
dataFull <- read.table(file, sep = ";", header = TRUE, na.strings = "?")

dataFull$Date <- as.Date(dataFull$Date, format = "%d/%m/%Y")

data <- subset(dataFull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

par(mcol = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(data$datetime,data$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(data$datetime,data$Sub_metering_1, col = "black", type = "l", main = "", xlab = "", ylab = "Energy Sub Metering")
lines(data$datetime,data$Sub_metering_2, col = "red")
lines(data$datetime,data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(data$datetime,data$Voltage, type = "l", main = "", xlab = "", ylab = "Voltage")

plot(data$datetime,data$Global_reactive_power, type = "l", main = "", xlab = "", ylab = "Global Reactive Power (kilowatts)")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()