# Set working directory
setwd("~/Documents/Documentos/Coursera/Exploratory_DataAnalysis/ExData_Plotting1")

# Reading dataset
data <- read.csv("household_power_consumption.txt", sep=';', header=T, na.strings="?")

# Changing the format of Date variable
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting data
data2 <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

# Create DateTime variable
DateTime <- paste(data2$Date, data2$Time)
data2$DateTime <- as.POSIXct(DateTime)

# Making Plot 3
plot(data2$DateTime, data2$Sub_metering_1, xlab="", ylab="Energy sub mettering", type="l")
lines(data2$DateTime, data2$Sub_metering_2,col='Red', type = "S")
lines(data2$DateTime, data2$Sub_metering_3,col='Blue', type = "S")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

# Saving plot 3
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
