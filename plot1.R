data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", nrows = 50 )
classes <- sapply(data, class)
fields <- names(data)
data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, colClasses = classes, na.strings = "?", skip = 66637, nrows =2880)
colnames(data) <- fields

## Plot 1
png("ExData_Plotting1/plot1.png", bg = "transparent")
hist(data$Global_active_power, col = "red" , main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()