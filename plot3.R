
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

powerdata <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",]

subm1 <- as.numeric(powerdata$Sub_metering_1)
subm2 <- as.numeric(powerdata$Sub_metering_2)
subm3 <- powerdata$Sub_metering_3

datetimes <- paste(powerdata$Date, powerdata$Time)

# strptime wasn't working for me despite putting in the correct format.
# This is a silly workaround but it will do.
datetimes <- paste(0, substr(datetimes, 1, 2), 0, substr(datetimes, 3,nchar(datetimes[1])), sep="")

datetimes <- strptime(datetimes, format = "%d/%m/%Y %H:%M:%S")

png(file="plot3.png")

plot(datetimes, subm1, type = "l", col="grey", ylab="Energy sub metering", xlab="")
lines(datetimes, subm2, col="red")
lines(datetimes, subm3, col="blue")

legend("topright", lty = 1, lwd = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("grey", "red", "blue"))

dev.off()
