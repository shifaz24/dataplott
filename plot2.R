gap <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
gap$Date <- as.Date(gap$Date, format="%d/%m/%Y")

subset <- subset(gap, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


conv_subset <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(conv_subset)

plot(subset$Global_active_power,  type="l", ylab="Global Active Power (kilowatts)", xlab="")


dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()