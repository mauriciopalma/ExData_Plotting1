# Set working directory to the folder where this script AND the datafile is located

p1data <- read.csv("household_power_consumption.txt"
                   , sep = ";"
                   , na.strings = "?"
                   , colClasses = c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
                   )

p1data <- p1data[ p1data[,"Date"] %in% c("1/2/2007","2/2/2007"),]

p1data <- cbind(p1data,strptime(paste(p1data$Date,p1data$Time), "%d/%m/%Y %X"))

colnames(p1data)[10] <- "Datetime"

png(file = "plot2.png")

plot(p1data$Datetime,p1data$Global_active_power,type="l",
     main="",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
