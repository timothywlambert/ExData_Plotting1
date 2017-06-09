###############
#Plot 2
###############

#Read data in and subset by date 2/1/2007 and 2/2/2007
filename <- paste0(getwd(),"/exdata_data_household_power_consumption/household_power_consumption.txt")
data <- read.table(filename, header = TRUE, sep = ";")
data1 <- subset(data, Date == "2/1/2007" | Date == "2/2/2007")

data1$Date <- as.Date(data1$Date, format = "%m/%d/%Y")

#Coerce Global Active Power to numeric
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))

#Combine Data and Time into one field and coerce 
data1$DateTime <- paste(data1$Date, data1$Time)
data1$DateTime <- as.POSIXct(data1$DateTime)

#Create plot and save as a PNG file to working directory
png(filename = paste0(getwd(),"/plot2.png"))
plot(data1$Global_active_power ~ data1$DateTime, type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()
