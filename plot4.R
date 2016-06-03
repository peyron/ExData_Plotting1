data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", nrows = 50 )
classes <- sapply(data, class)
fields <- names(data)
data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, colClasses = classes, na.strings = "?", skip = 66637, nrows =2880)
colnames(data) <- fields

## Plot 4
data$datetime <- with(data, paste(Date, Time))
data$datetime <- as.POSIXct(data$datetime, format = "%d/%m/%Y %H:%M:%S")

initial <- par()

png("ExData_Plotting1/plot4.png", bg = "transparent")

par(mfrow=c(2,2), mar=c(5.1,4.1,4.1,2.1), oma=c(0,2,0,0)) 

with(data,
     {plot(Global_active_power ~ datetime, ylab = "Global Active Power", xlab = "", type = "l")
             
             plot(Voltage ~ datetime, ylab = "Voltage", type = "l")
             
             plot(Sub_metering_1 ~ datetime, ylab = "Energy sub metering", xlab = "", type = "l")
             lines(Sub_metering_2 ~ datetime, col = "red")
             lines(Sub_metering_3 ~ datetime, col = "blue")
             legend("topright", bty = "n", col = c("black", "red", "blue"), lty = c(1, 1, 1), legend = colnames(data[,7:9]))
             
             plot(Global_reactive_power ~ datetime, type = "l")
             
     }
     
)

par <- initial

dev.off()

