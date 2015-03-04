# Read the data, which has already been stripped to contain only
# the 1st and 2nd of February 2007, setting the separation 
# character as semicolon
data <- read.csv("01_02.csv", sep = ";", na.strings=c("?"))

# Combine date and time to a new variable
datetimes <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Plot the date with type line (l)
plot(datetimes, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Copy the plot to a PNG file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()