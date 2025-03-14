data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?",""))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$timetemp <- paste(data$Date, data$Time)
data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")
data <- subset(data , data$Date ==  "2007-02-01" | data$Date ==  "2007-02-02")
with(data, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()