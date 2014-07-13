# Load the data into R and define Date column class as date
raw_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")

# Subset the raw data to retrieve data from the dates 2007-02-02 and 2007-02-02
target_data <- raw_data[raw_data$Date=="2007-02-01" | raw_data$Date=="2007-02-02", ]

# Define the other column classes
target_data$Time <- as.POSIXct(paste(target_data$Date, target_data$Time), format = "%Y-%m-%d %H:%M:%S")
target_data[,3:9] <- sapply(target_data[,3:9], as.numeric)

# Plot histogram and generate png file
hist(target_data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()

