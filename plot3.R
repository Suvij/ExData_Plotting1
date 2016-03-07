# Getting full dataset
data <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting the data
subSetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


# Converting dates
datetime <- paste(as.Date(subSetData$Date), subSetData$Time)
subSetData$Datetime <- as.POSIXct(datetime)

# Plot 3
png("plot3.png", width=480, height=480)

with(subSetData, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy Submetering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()