## read data from working directory
## subset data to the working date range


epcdataFile <- "./household_power_consumption.txt"

epcdata <- read.table(epcdataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetepcData <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007") ,]

##str(subSetepcData)

globalActivePower <- as.numeric(subSetepcData$Global_active_power)

## create png plot file

png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##close file

dev.off()