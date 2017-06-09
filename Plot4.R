############
#Plot 4
############

#Read data in and subset by date 2/1/2007 and 2/2/2007
filename <- paste0(getwd(),"/exdata_data_household_power_consumption/household_power_consumption.txt")
data <- read.table(filename, header = TRUE, sep = ";")
data1 <- subset(data, Date == "2/1/2007" | Date == "2/2/2007")

data1$Date <- as.Date(data1$Date, format = "%m/%d/%Y")

#Combine Data and Time into one field and coerce 
data1$DateTime <- paste(data1$Date, data1$Time)
data1$DateTime <- as.POSIXct(data1$DateTime)

#Coerce Global Active Power to numeric
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))

#Coerce Data
data1$Voltage <- as.numeric(as.character(data1$Voltage))
data1$Global_reactive_power <- as.numeric(as.character(data1$Global_reactive_power))
data1$Sub_metering_1 <- as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 <- as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3 <- as.numeric(as.character(data1$Sub_metering_3))

png(filename = paste0(getwd(),"/plot4.png"))
par(mfcol = c(2,2))
plot(data1$Global_active_power ~ data1$DateTime, type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "")
plot(data1$Sub_metering_1 ~ data1$DateTime, type = "l", ylab = "Energy sub meeting",
     xlab = "", ylim = c(0,30), col = "black")
lines(data1$Sub_metering_2 ~ data1$DateTime, col = "red")
lines(data1$Sub_metering_3 ~ data1$DateTime, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
plot(data1$Voltage ~ data1$DateTime, type = "l", xlab = "datatime",
     ylab = "Voltage")
plot(data1$Global_reactive_power ~ data1$DateTime, type = "l", xlab = "datatime",
     ylab = "Global_reactive_power")
dev.off()
