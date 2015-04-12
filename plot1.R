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

#first plot 
hist(as.numeric(datamod$Global_active_power), main="Global Active Power",
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#finally i save the plot
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
