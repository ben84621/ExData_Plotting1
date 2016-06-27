setwd("~/Documents/datascience/")

datafile <- "files/household_power_consumption.txt"
alldata <- read.table(datafile, header=TRUE, sep = ";", na.strings = "?")

data_subset <- subset(alldata, (Date == "1/2/2007") | (Date == "2/2/2007"))
data_subset <- transform(data_subset, dt = paste(data_subset$Date, data_subset$Time))
data_subset$dt<-strptime(data_subset$dt, "%d/%m/%Y %H:%M:%S")

png(filename = "~/Documents/datascience/explore_data/plot3.png", width = 480, height = 480)
plot(data_subset$dt, data_subset$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy Sub Metering") 
lines(data_subset$dt, data_subset$Sub_metering_2, col = "red")
lines(data_subset$dt, data_subset$Sub_metering_3, col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))