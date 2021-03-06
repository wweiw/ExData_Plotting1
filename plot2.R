# loading data
HousedataFile <- "./household_power_consumption.txt"
data <- read.table(HousedataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset the data to use data from dates 2017-02-01 and 2017-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert Time to required time format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# convert Global_active_power to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Plot the data and output to desire size of graphic format
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
