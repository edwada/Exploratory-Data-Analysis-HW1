rawData <- read.table("household_power_consumption.txt", 
                      sep = ";", 
                      header = TRUE)

rawData$Date <- as.Date(as.character(rawData$Date), "%d/%m/%Y")

electricData <- rawData[rawData$Date>=as.Date("2007-02-01")
                        & rawData$Date<=as.Date("2007-02-02"),]

electricData$Time <- strptime(electricData$Time, format="%H:%M:%S") 
electricData$Global_active_power <- as.numeric(as.character(electricData$Global_active_power))

png('plot1.png', width=480, height=480)
hist(electricData$Global_active_power, 
     main="Global Active Power", 
     col="Red", 
     ylim=c(0, 1200),
     xlab="Global Active Power (kilowatts)")
dev.off()



