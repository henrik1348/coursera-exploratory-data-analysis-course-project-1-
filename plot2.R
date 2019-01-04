#Load and subset data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
df <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
gap <- as.numeric(df$Global_active_power) #Make numeric

png("plot1.png", width=480, height=480)
hist(df, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
