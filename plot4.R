Sys.setlocale(category = "LC_ALL", locale = "english")

rawData <- read.table("household_power_consumption.txt", 
                      sep = ";", 
                      header = TRUE)

rawData$Date <- as.Date(as.character(rawData$Date), "%d/%m/%Y")

electricData <- rawData[rawData$Date>=as.Date("2007-02-01")
                        & rawData$Date<=as.Date("2007-02-02"),]

electricData$Global_active_power <- as.numeric(as.character(electricData$Global_active_power))

png('plot4.png', width=480, height=480)
par(mfcol=c(2,2))
plot(as.POSIXct(paste(electricData$Date, as.character(electricData$Time)), format="%Y-%m-%d %H:%M:%S"),
     electricData$Global_active_power,
     type="l", 
     ylab="Global Active Power",
     xlab="")

plot(as.POSIXct(paste(electricData$Date, as.character(electricData$Time)), format="%Y-%m-%d %H:%M:%S"),
     as.numeric(as.character(electricData$Sub_metering_1)),
     type="l", 
     ylab="Energy sub metering",
     xlab="")
lines(as.POSIXct(paste(electricData$Date, as.character(electricData$Time)), format="%Y-%m-%d %H:%M:%S"),
      as.numeric(as.character(electricData$Sub_metering_2)),
      type="l",
      col="red")
lines(as.POSIXct(paste(electricData$Date, as.character(electricData$Time)), format="%Y-%m-%d %H:%M:%S"),
      as.numeric(as.character(electricData$Sub_metering_3)),
      type="l",
      col="blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "red", "blue"))

plot(as.POSIXct(paste(electricData$Date, as.character(electricData$Time)), format="%Y-%m-%d %H:%M:%S"),
     as.numeric(as.character(electricData$Voltage)),
     type="l", 
     ylab="Voltage",
     xlab="datetime")

plot(as.POSIXct(paste(electricData$Date, as.character(electricData$Time)), format="%Y-%m-%d %H:%M:%S"),
     as.numeric(as.character(electricData$Global_reactive_power)),
     type="l", 
     ylab="Global_reactive_power",
     xlab="datetime")

dev.off()


