##########
#Plot 1
##########

#Read data in and subset by date 2/1/2007 and 2/2/2007
filename <- paste0(getwd(),"/exdata_data_household_power_consumption/household_power_consumption.txt")
data <- read.table(filename, header = TRUE, sep = ";")
data1 <- subset(data, Date == "2/1/2007" | Date == "2/2/2007")

data1$Date <- as.Date(data1$Date, format = "%m/%d/%Y")

#Coerce Global Active Power to numeric
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))

#Create histogram and save as a PNG file to working directory
png(filename = paste0(getwd(),"/plot1.png"))
hist(data1$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     xlim = c(0,6), ylim = c(1,1200), breaks = 12)
dev.off()
