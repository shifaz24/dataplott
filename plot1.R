gap<- read.csv("householdpowerconsumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
gap$Date <- as.Date(gap$Date, format="%d/%m/%Y")


set <- subset(gap, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))



hist(set$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power ", ylab="Frequency", col="red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
