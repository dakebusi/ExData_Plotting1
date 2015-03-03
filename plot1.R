# Read the data, which has already been stripped to contain only
# the 1st and 2nd of February 2007, setting the separation 
# character as semicolon
data <- read.csv("01_02.csv", sep = ";", na.strings=c("?"))

# Generate the histogram of active power
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# Copy the plot to a PNG file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
