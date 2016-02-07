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

#---------------------------------------------------------------------------------
# Plot2: To create png of Global Active Power with dates
#---------------------------------------------------------------------------------

png(filename = "plot2.png", height = 480, width = 480) 

datetime <- paste(febdata$Date, febdata$Time)
datetime <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")
datetime

plot(datetime, febdata$Global_active_power, type="l", 
               xlab="", ylab="Global Active Power (kilowatts)")
  
dev.off()

#---------------------------------------------------------------------------------
# Plot2: To display plot Global Active Power with dates/days on graphics window
#---------------------------------------------------------------------------------

plot(datetime, febdata$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")





