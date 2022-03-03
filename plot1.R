## Getting full dataset
sourcefile <- "household_power_consumption.txt"
data <- read.table(sourcefile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Subsetting the data
dateddata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
