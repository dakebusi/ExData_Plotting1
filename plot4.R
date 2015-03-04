# Read the data, which has already been stripped to contain only
# the 1st and 2nd of February 2007, setting the separation 
# character as semicolon
data <- read.csv("01_02.csv", sep = ";", na.strings=c("?"))

# Combine date and time to a new variable
datetimes <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Set a 2x2 plot canvas
par(mfrow=c(2,2))

# Prepare the first plot, but not showing the points
plot(datetimes, data$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")

# Now add the lines
lines(datetimes, data$Global_active_power, xlab = "", ylab= "Global Active Power (kilowatts)")

# Prepare the second plot, but not showing the points
plot(datetimes, data$Voltage, type="n", xlab="", ylab="Global Active Power (kilowatts)")

# Now add the lines
lines(datetimes, data$Voltage, xlab="datetime", ylab= "Voltage")

# Prepare the third plot, but not showing the points
plot(datetimes, data$Sub_metering_1 , type="n", xlab="", ylab="Energy sub metering")

# Now add the lines
lines(datetimes, data$Sub_metering_1)
lines(datetimes, data$Sub_metering_2, col="red")
lines(datetimes, data$Sub_metering_3, col="blue")

# Add a legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd=1, col=c("black","red","blue"), y.intersp=.5, cex=0.5, inset = 0)

# Prepare the fourth plot, but not showing the points
plot(datetimes, data$Global_reactive_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")

# Now add the lines
lines(datetimes, data$Global_reactive_power)

# Copy the plot to a PNG file
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()