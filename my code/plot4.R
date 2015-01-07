setwd("D:\\#coursera\\Data Science\\Exploratory Data Analysis\\Course Projects\\CP1\\ExData_Plotting1")

filename <- "household_power_consumption.txt"

#first row 66638
#last row 69517

dt <- read.table(filename, header=FALSE, skip=66637, nrows = 69517-66638+1, dec=".", sep=";", stringsAsFactors = FALSE)

names(dt)=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dt$datetime <- strptime(paste(dt$Date,dt$Time), "%d/%m/%Y %H:%M:%S")

dev.copy(png,"my plots\\plot4.png")


par (mfrow = c(2,2))

#1

plot(dt$datetime, dt$Global_active_power, pch=".", xlab="", ylab="Global Active Power")
lines(dt$datetime, dt$Global_active_power)

#2

plot(dt$datetime, dt$Voltage, pch=".",xlab = "datetime", ylab="Voltage")
lines(dt$datetime, dt$Voltage)

#3

plot(dt$datetime,dt$Sub_metering_1, type="n", pch=".", xlab="", ylab="Energy sub metering")
lines(dt$datetime,dt$Sub_metering_1)
lines(dt$datetime,dt$Sub_metering_2, col="red")
lines(dt$datetime,dt$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), bty="n")

#4

plot(dt$datetime, dt$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", pch=".")
lines(dt$datetime, dt$Global_reactive_power)

#copy to png


dev.off()