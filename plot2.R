gap <- read.csv("householdpowerconsumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
gap$Date <- as.Date(gap$Date, format="%d/%m/%Y")

set <- subset(gap, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


conv_subset <- paste(as.Date(set$Date),set$Time)
set$Datetime <- as.POSIXct(conv_subset)

plot(subset$Global_active_power,  type="l", ylab="Global Active Power (kilowatts)", xlab="")


dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
