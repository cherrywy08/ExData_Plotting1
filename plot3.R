# Load the data into R and define Date column class as date
raw_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")

# Subset the raw data to retrieve data from the dates 2007-02-02 and 2007-02-02
target_data <- raw_data[raw_data$Date=="2007-02-01" | raw_data$Date=="2007-02-02", ]

# Define the other column classes
target_data$Time <- as.POSIXct(paste(target_data$Date, target_data$Time), format = "%Y-%m-%d %H:%M:%S")
target_data[,3:9] <- sapply(target_data[,3:9], as.numeric)

# Plot
par(bg = "white")
with(target_data, plot(Time, Sub_metering_1, type = 'n', xlab = "", ylab = "Energy sub metering"))
with(target_data, lines(Time, Sub_metering_1))
with(target_data, lines(Time, Sub_metering_2, col = "red"))
with(target_data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)
dev.copy(png, file = "plot3.png")
dev.off()
