# Set working directory before running the code.

setwd("D:/DATA SCIENCE/4.Exploratory data analysis/project")

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

#---------------------------------------------------------------------------------
# Plot1: To create png of  Histogram of Global Active Power
#---------------------------------------------------------------------------------

febdata$Global_active_power <- as.numeric(febdata$Global_active_power)

png(filename = "plot1.png", height = 480, width = 480)

hist(febdata$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()

#---------------------------------------------------------------------------------
# Plot1: To display Histogram of Global Active Power on graphics window
#---------------------------------------------------------------------------------
hist(febdata$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")



