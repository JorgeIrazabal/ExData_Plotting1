# Set work directory
setwd("H:/Curso/Week1")
# Load data from file
energyData <- read.table("household_power_consumption.txt", sep=";", 
                         header=TRUE,na.strings = "?")
# Filter data
energyData2<-subset(energyData, Date == "1/2/2007" | Date == "2/2/2007")

# Redirect to image
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
    bg = "white")
#Plot Data
hist(energyData2$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (Killowats)",col="red")
#Saving Plots 
dev.off()
