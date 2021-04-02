gap<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
gap$Date <- as.Date(gap$Date, format="%d/%m/%Y")


subset <- subset(gap, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))



hist(subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power ", ylab="Frequency", col="red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()