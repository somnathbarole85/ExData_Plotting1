# Set working directory before running the code.

setwd("D:/DATA SCIENCE/4.Exploratory data analysis/Week-1/project1")

require(data.table)
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
head(data)

data$Date <- as.Date((data$Date), "%d/%m/%Y")
head(data)
class(data)

# Now date is in yyyy-mm-dd format, select data on dates 2007-02-01 and 2007-02-02

feb1 <- as.Date("2007-02-01")
feb2 <- as.Date("2007-02-02")

febdata <- data[data$Date >= feb1 & data$Date <= feb2, ]
head(febdata)
length(febdata$Date)
names(febdata)

febdata$Global_active_power <- as.numeric(febdata$Global_active_power)



datetime <- paste(febdata$Date, febdata$Time)
datetime <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")
head(datetime)

#--------------------------------------------------------------------------------------------------------
# Plot4: To create png of with four plots together on one sheet
#--------------------------------------------------------------------------------------------------------

png(filename = "plot4.png", height = 480, width = 480) 

par(mfrow=c(2,2))

with(febdata, plot(datetime, febdata$Global_active_power, type="l", 
                   xlab="", ylab="Global Active Power"))

with(febdata, plot(datetime, febdata$Voltage, type="l", 
                   xlab="datetime", ylab="Voltage"))


with(febdata, plot(datetime, febdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(febdata, points(datetime, febdata$Sub_metering_1, type = "l", col="black"))
with(febdata, points(datetime, febdata$Sub_metering_2, type = "l", col="red"))
with(febdata, points(datetime, febdata$Sub_metering_3, type = "l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), cex = 0.8, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(febdata, plot(datetime, febdata$Global_reactive_power, type="l", 
                   xlab="datetime", ylab="Global_reactive_power"))

dev.off()


#--------------------------------------------------------------------------------------------------------
# Plot4: To display four plots together on one sheet on graphics window
#--------------------------------------------------------------------------------------------------------
# Some plots may look distorted on graphic window; please see the created png for
# better visualization

par(mfrow=c(2,2))

with(febdata, plot(datetime, febdata$Global_active_power, type="l", 
                   xlab="", ylab="Global Active Power"))

with(febdata, plot(datetime, febdata$Voltage, type="l", 
                   xlab="datetime", ylab="Voltage"))


with(febdata, plot(datetime, febdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(febdata, points(datetime, febdata$Sub_metering_1, type = "l", col="black"))
with(febdata, points(datetime, febdata$Sub_metering_2, type = "l", col="red"))
with(febdata, points(datetime, febdata$Sub_metering_3, type = "l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), cex = 0.8, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(febdata, plot(datetime, febdata$Global_reactive_power, type="l", 
                   xlab="datetime", ylab="Global_reactive_power"))

