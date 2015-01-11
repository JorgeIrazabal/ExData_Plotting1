# Set work directory
setwd("H:/Curso/Week1")
# Load data from file
energyData <- read.table("household_power_consumption.txt", sep=";", 
                         header=TRUE,na.strings = "?")
# Filter data
energyData2<-subset(energyData, Date == "1/2/2007" | Date == "2/2/2007")

# Join Date and Time
energyData2$DateTime <- as.POSIXct(
  strptime(paste(energyData2$Date,energyData2$Time), "%d/%m/%Y %H:%M:%S"))

# Redirect to image
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

# Divide plot in 4 parts
par(mfrow=c(2,2))

# Plot1
plot(energyData2$DateTime,energyData2$Global_active_power,type="l",xlab="", 
     ylab="Global Active Power")

# Plot2
plot(energyData2$DateTime,energyData2$Voltage,type="l",xlab="datatime", 
     ylab="Voltaje")

# Plot3
plot(energyData2$DateTime,energyData2$Sub_metering_1,type="l",xlab="", 
     ylab="Energy sub metering")
lines(energyData2$DateTime,energyData2$Sub_metering_2, col="red")
lines(energyData2$DateTime,energyData2$Sub_metering_3, col="blue")
legend("topright", col = c("black","blue", "red"), 
        legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
        lty=c(1,1,1),
        lwd=c(2,2,2))

# Plot4
plot(energyData2$DateTime,energyData2$Global_reactive_power,type="l",
     xlab="datatime", ylab="Global Reactive Power")

#Saving image
dev.off()
