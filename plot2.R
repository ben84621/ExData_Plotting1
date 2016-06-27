setwd("~/Documents/datascience/")

datafile <- "files/household_power_consumption.txt"
alldata <- read.table(datafile, header=TRUE, sep = ";", na.strings = "?")

data_subset <- subset(alldata, (Date == "1/2/2007") | (Date == "2/2/2007"))
data_subset <- transform(data_subset, dt = paste(data_subset$Date, data_subset$Time))
data_subset$dt<-strptime(data_subset$dt, "%d/%m/%Y %H:%M:%S")
png(filename = "~/Documents/datascience/explore_data/plot2.png")
plot(data_subset$dt, data_subset$Global_active_power, type='l', xlab="", ylab = "Global Active Power (kilowatts)")