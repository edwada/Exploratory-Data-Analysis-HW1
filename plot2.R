Sys.setlocale(category = "LC_ALL", locale = "english")

rawData <- read.table("household_power_consumption.txt", 
                      sep = ";", 
                      header = TRUE)

rawData$Date <- as.Date(as.character(rawData$Date), "%d/%m/%Y")

electricData <- rawData[rawData$Date>=as.Date("2007-02-01")
                        & rawData$Date<=as.Date("2007-02-02"),]

electricData$Global_active_power <- as.numeric(as.character(electricData$Global_active_power))

png('plot2.png', width=480, height=480)
plot(as.POSIXct(paste(electricData$Date, as.character(electricData$Time)), format="%Y-%m-%d %H:%M:%S"),
      electricData$Global_active_power,
     type="l", 
     ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()



