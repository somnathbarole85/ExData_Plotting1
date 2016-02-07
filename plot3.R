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


#----------------------------------------------------------------------------------------------------------
# Plot3: To create png of Energy sub metring
#----------------------------------------------------------------------------------------------------------

png(filename = "plot3.png", height = 480, width = 480) 


with(febdata, plot(datetime, febdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(febdata, points(datetime, febdata$Sub_metering_1, type = "l", col="black"))
with(febdata, points(datetime, febdata$Sub_metering_2, type = "l", col="red"))
with(febdata, points(datetime, febdata$Sub_metering_3, type = "l", col="blue"))


legend("topright", lty=1, col=c("black", "red", "blue"), cex = 1, 
                   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

#---------------------------------------------------------------------------------------------------------
# Plot3: To display plot of Energy sub metring on graphics window
#---------------------------------------------------------------------------------------------------------

with(febdata, plot(datetime, febdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(febdata, points(datetime, febdata$Sub_metering_1, type = "l", col="black"))
with(febdata, points(datetime, febdata$Sub_metering_2, type = "l", col="red"))
with(febdata, points(datetime, febdata$Sub_metering_3, type = "l", col="blue"))


legend("topright", lty=1, col=c("black", "red", "blue"), cex = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))




