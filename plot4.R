# loading data
HousedataFile <- "./household_power_consumption.txt"
data <- read.table(HousedataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset the data to use data from dates 2017-02-01 and 2017-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert Time to required time format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# convert the following fields to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# plot the data and output to desire size of graphic format
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# plot top left
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# plot top right
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# plot bottom left
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# plot bottom right
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()