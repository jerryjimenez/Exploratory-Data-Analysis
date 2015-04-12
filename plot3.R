#Ready my data
data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Convert my data in data format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset my date to the two days we need
datamod <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert date and times
datetime <- paste(as.Date(datamod$Date), datamod$Time)
datamod$Datetime <- as.POSIXct(datetime)

#make the plot
plot(datamod$Sub_metering_1~datamod$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
lines(datamod$Sub_metering_2~datamod$Datetime,col='Red')
lines(datamod$Sub_metering_3~datamod$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#finally i save it 
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
