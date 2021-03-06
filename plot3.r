## read data from working directory
## subset data to the working date range

epcdataFile <- "./household_power_consumption.txt"

epcdata <- read.table(epcdataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetepcData <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007") ,]


##str(subSetepcData)

datetime <- strptime(paste(subSetepcData$Date, subSetepcData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSetepcData$Global_active_power)

subMetering1 <- as.numeric(subSetepcData$Sub_metering_1)

subMetering2 <- as.numeric(subSetepcData$Sub_metering_2)

subMetering3 <- as.numeric(subSetepcData$Sub_metering_3)

##create png plot file

png("plot3.png", width=480, height=480)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMetering2, type="l", col="red")

lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## close file

dev.off()