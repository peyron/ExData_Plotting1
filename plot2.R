data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", nrows = 50 )
classes <- sapply(data, class)
fields <- names(data)
data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, colClasses = classes, na.strings = "?", skip = 66637, nrows =2880)
colnames(data) <- fields

## Plot 2
data$datetime <- with(data, paste(Date, Time))
data$datetime <- as.POSIXct(data$datetime, format = "%d/%m/%Y %H:%M:%S")


png("ExData_Plotting1/plot2.png", bg = "transparent")
with(data, plot(Global_active_power ~ datetime, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))

dev.off()