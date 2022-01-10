
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

powerdata <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",]

GAP <- as.numeric(powerdata$Global_active_power)

datetimes <- paste(powerdata$Date, powerdata$Time)

# strptime wasn't working for me despite putting in the correct format.
# This is a silly workaround but it will do.
datetimes <- paste(0, substr(datetimes, 1, 2), 0, substr(datetimes, 3,nchar(datetimes[1])), sep="")

datetimes <- strptime(datetimes, format = "%d/%m/%Y %H:%M:%S")

png(file="plot2.png")

plot(datetimes, GAP, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
