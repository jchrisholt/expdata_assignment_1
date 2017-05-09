## plot1.R
# Exploratory Analysis Week 1 Assignment

# Load needed libraries
library(dplyr)
library(tidyr)
library(lubridate)

# Read in the file
hpc <- read.delim("household_power_consumption.txt", 
                  header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Convert Date to date object
hpc$Date <- as.Date(strptime(hpc$Date, format = "%d/%m/%Y"))

# Pull out the 2 days 2007-02-01 and 2007-02-02
hpc_cleaned <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert needed varibles to numeric 
hpc_cleaned$Global_active_power <- as.numeric(hpc_cleaned$Global_active_power)
hpc_cleaned$Global_reactive_power <- as.numeric(hpc_cleaned$Global_reactive_power)
hpc_cleaned$Sub_metering_1 <- as.numeric(hpc_cleaned$Sub_metering_1)
hpc_cleaned$Sub_metering_2 <- as.numeric(hpc_cleaned$Sub_metering_2)
hpc_cleaned$Sub_metering_3 <- as.numeric(hpc_cleaned$Sub_metering_3)

## Create the device 
dev.copy(png, file = "plot1.png")
## Create the graph
hist(hpc_cleaned$Global_active_power, 
     col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
