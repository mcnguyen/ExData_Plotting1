
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
with(dat, {plot(strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"), dat$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")})
with(dat, {points(strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"), dat$Sub_metering_1, type="S", col="black")})
with(dat, {points(strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"), dat$Sub_metering_2, type="S", col="red")})
with(dat, {points(strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"), dat$Sub_metering_3, type="S", col="blue")})
legend("topright", pch="-", lwd=3, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save plot to PNG file
dev.copy(png, "plot3.png")
dev.off()


