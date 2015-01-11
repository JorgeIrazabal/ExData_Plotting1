# Set work directory
setwd("H:/Curso/Week1")
# Load data from file
energyData <- read.table("household_power_consumption.txt", sep=";", 
                         header=TRUE,na.strings = "?")
# Filter data
energyData2<-subset(energyData, Date == "1/2/2007" | Date == "2/2/2007")

# Join Date and Tine
energyData2$DateTime <- as.POSIXct(strptime(
  paste(energyData2$Date,energyData2$Time), "%d/%m/%Y %H:%M:%S"))

# Redirect to image
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

#Plot Data
plot(energyData2$DateTime,energyData2$Global_active_power,type="l",xlab="", 
     ylab="Global Active Power (kilowatts)")

#Saving Plots 
dev.off()
