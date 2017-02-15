# loading data
HousedataFile <- "./household_power_consumption.txt"
data <- read.table(HousedataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset the data to use data from dates 2017-02-01 and 2017-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert Time to required time format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# convert the following fields to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Plot the data and output to desire size of graphic format
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
