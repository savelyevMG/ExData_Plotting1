filename <- "data\\household_power_consumption.txt"

setwd("D:\\#coursera\\Data Science\\Exploratory Data Analysis\\Course Projects\\CP1")

#first row 66638
#last row 69517

dt <- read.table(filename, header=FALSE, skip=66637, nrows = 69517-66638+1, dec=".", sep=";", stringsAsFactors = FALSE)

names(dt)=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dt$datetime <- strptime(paste(dt$Date,dt$Time), "%d/%m/%Y %H:%M:%S")


hist(dt$Global_active_power,xlab="Global Active Power (kilowatts)", col="red", main ="Global Active Power")

dev.copy(png,"plot1.png")

dev.off()