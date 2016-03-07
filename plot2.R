# Getting full dataset
data <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting the data
subSetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


# Converting dates
datetime <- paste(as.Date(subSetData$Date), subSetData$Time)
subSetData$Datetime <- as.POSIXct(datetime)

# Plot 2
png("plot2.png", width=480, height=480)

plot(subSetData$Global_active_power~subSetData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()