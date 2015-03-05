
# set working directory
setwd("C:\\Users\\Minhtam\\Documents\\My Projects\\exdata-012")

# read data into memory
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?" )

# select desired data and eliminate the rest
dates <- as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d")
z <- data[as.Date(data$Date,format="%d/%m/%Y") >= dates[1],]
rm(data)
dat <- z[as.Date(z$Date,format="%d/%m/%Y") <= dates[2],]
rm(z)

# plot the data
par(mfrow=c(1,1))
hist(dat$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# save plot to PNG file
dev.copy(png, "plot1.png")
dev.off()

