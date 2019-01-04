#Load and subset data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
df <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

# Start constructing the plot
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(df$Global_active_power)
subMetering1 <- as.numeric(df$Sub_metering_1)
subMetering2 <- as.numeric(df$Sub_metering_2)
subMetering3 <- as.numeric(df$Sub_metering_3)
grp <- as.numeric(df$Global_reactive_power)
vol <- as.numeric(df$Voltage)

# Let's plot!

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(datetime, vol, type = "l", xlab="datetime", ylab = "Voltage")
plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = , lwd = 2.5, col = c("black", "red", "blue"), bty="o")
plot(datetime, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()