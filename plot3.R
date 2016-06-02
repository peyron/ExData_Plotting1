data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", nrows = 50 )
classes <- sapply(data, class)
fields <- names(data)
data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, colClasses = classes, na.strings = "?", skip = 66637, nrows =2880)
colnames(data) <- fields

## Plot 3
data$datetime <- with(data, paste(Date, Time))
data$datetime <- as.POSIXct(data$datetime, format = "%d/%m/%Y %H:%M:%S")

png("ExData_Plotting1/plot3.png", bg = "transparent")

with(data, plot(Sub_metering_1 ~ datetime, ylab = "Energy sub metering", xlab = "", type = "l"))
with(data, lines(Sub_metering_2 ~ datetime, col = "red"))
with(data, lines(Sub_metering_3 ~ datetime, col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), legend = colnames(data[,7:9]))

dev.off()