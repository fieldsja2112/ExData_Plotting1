## read data from working directory
## subset data to the working date range

epcdataFile <- "./household_power_consumption.txt"

epcdata <- read.table(epcdataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetepcData <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007") ,]


##str(subSetepcData)

datetime <- strptime(paste(subSetepcData$Date, subSetepcData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSetepcData$Global_active_power)

## create png plot file

png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##close file

dev.off()