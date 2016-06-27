setwd("~/Documents/datascience/")

datafile <- "files/household_power_consumption.txt"
powerdata <- read.table(datafile, header=TRUE, sep = ";", na.strings = "?")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
powerdata$Time <- strptime(powerdata$Time, "%H:%M:%S")

data_subset <- subset(powerdata, (Date == "2007-02-01") | (Date == "2007-02-02"))

png(filename = "~/Documents/datascience/explore_data/plot1.png")
hist(data_subset$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()