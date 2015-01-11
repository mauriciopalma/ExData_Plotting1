# Set working directory to the folder where this script AND the datafile is located

p1data <- read.csv("household_power_consumption.txt"
                   , sep = ";"
                   , na.strings = "?"
                   , colClasses = c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
                   )

p1data <- p1data[ p1data[,"Date"] %in% c("1/2/2007","2/2/2007"),]

p1data <- cbind(p1data,strptime(paste(p1data$Date,p1data$Time), "%d/%m/%Y %X"))

colnames(p1data)[10] <- "Datetime"

png(file = "plot4.png")

par(mfrow = c(2,2))

# top-left chart
plot(p1data$Datetime,p1data$Global_active_power,type="l",
     main="",
     xlab="",
     ylab="Global Active Power")

# top-right chart
plot(p1data$Datetime,p1data$Voltage,type="l",
     main="",
     xlab="datetime",
     ylab="Voltage")


# bottom-left chart
plot(p1data$Datetime,p1data$Sub_metering_1,type="l", 
     col="black",
     xlab = "",
     ylab = "Energy sub metering")
lines(p1data$Datetime,p1data$Sub_metering_2,type="l", col="red")
lines(p1data$Datetime,p1data$Sub_metering_3,type="l", col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       bty = "n")

# bottom-right chart
plot(p1data$Datetime,p1data$Global_reactive_power,type="l",
     main="",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
