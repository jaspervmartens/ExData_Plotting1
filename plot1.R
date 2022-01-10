
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

powerdata <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",]

GAP <- as.numeric(powerdata$Global_active_power)

png(file="plot1.png")

hist(GAP, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
