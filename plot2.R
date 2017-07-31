# Data Science: Exploratory Data Analysis
# Course Project 1
# plot2.R

rm(list = ls())

file = "household_power_consumption.txt"
dataFull <- read.table(file, sep = ";", header = TRUE, na.strings = "?")

dataFull$Date <- as.Date(dataFull$Date, format = "%d/%m/%Y")

data <- subset(dataFull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

plot(data$datetime,data$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()