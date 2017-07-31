# Data Science: Exploratory Data Analysis
# Course Project 1
# plot1.R

rm(list = ls())

file = "household_power_consumption.txt"
dataFull <- read.table(file, sep = ";", header = TRUE, na.strings = "?")

dataFull$Date <- as.Date(dataFull$Date, format = "%d/%m/%Y")

data <- subset(dataFull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()