
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

powerdata <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",]

GAP <- as.numeric(powerdata$Global_active_power)
GRP <- as.numeric(powerdata$Global_reactive_power)
volt <- as.numeric(powerdata$Voltage)
subm1 <- as.numeric(powerdata$Sub_metering_1)
subm2 <- as.numeric(powerdata$Sub_metering_2)
subm3 <- powerdata$Sub_metering_3

datetimes <- paste(powerdata$Date, powerdata$Time)

# strptime wasn't working for me despite putting in the correct format.
# This is a silly workaround but it will do.
datetimes <- paste(0, substr(datetimes, 1, 2), 0, substr(datetimes, 3,nchar(datetimes[1])), sep="")

datetimes <- strptime(datetimes, format = "%d/%m/%Y %H:%M:%S")

png(file="plot4.png")

par(mfrow=c(2,2),mar=c(5,4,4,2))

plot(datetimes, GAP, type = "l", ylab = "Global Active Power", xlab = "")

plot(datetimes, volt, type = "l", ylab = "Voltage", xlab = "datetime")

plot(datetimes, subm1, type = "l", col="grey", ylab="Energy sub metering", xlab="")
lines(datetimes, subm2, col="red")
lines(datetimes, subm3, col="blue")
legend("topright", lty = 1, lwd = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("grey", "red", "blue"), bty="n")

plot(datetimes, GRP, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
