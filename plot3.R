# Read the data, which has already been stripped to contain only
# the 1st and 2nd of February 2007, setting the separation 
# character as semicolon
data <- read.csv("01_02.csv", sep = ";", na.strings=c("?"))

# Combine date and time to a new variable
datetimes <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Prepare the plot, but not showing the points
plot(datetimes, data$Sub_metering_1 , type="n", xlab="", ylab="Energy sub metering")

# Now add the lines for each sub metering
lines(datetimes, data$Sub_metering_1)
lines(datetimes, data$Sub_metering_2, col="red")
lines(datetimes, data$Sub_metering_3, col="blue")

# Add a legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd=1, col=c("black","red","blue"), y.intersp=.75)
       
# Copy the plot to a PNG file
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()