gap <- read.csv("household_power_consumption.txt",  sep=';',header=G, na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
gap$Date <- as.Date(gap$Date, format="%m/%d/%Y")

subset <- subset(gap, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

conv_subset <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(conv_subset)

with(subset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=3, lwd=6, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()