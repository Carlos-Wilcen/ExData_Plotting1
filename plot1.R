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

# Making Plot 1
hist(data2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving plot 1
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
