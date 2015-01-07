setwd("D:\\#coursera\\Data Science\\Exploratory Data Analysis\\Course Projects\\CP1\\ExData_Plotting1")

filename <- "household_power_consumption.txt"

#I don't want to get weekdays in my native language, so set locale to Englisg
Sys.setlocale("LC_TIME","English")

#first row 66638
#last row 69517

dt <- read.table(filename, header=FALSE, skip=66637, nrows = 69517-66638+1, dec=".", sep=";", stringsAsFactors = FALSE)

names(dt)=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dt$datetime <- strptime(paste(dt$Date,dt$Time), "%d/%m/%Y %H:%M:%S")

png(filename="my plots\\plot2.png",type="cairo")

par (mfrow = c(1,1))
plot(dt$datetime,dt$Global_active_power, pch=".", xlab="", ylab="Global Active Power (kilowatts)")
lines(dt$datetime,dt$Global_active_power)

dev.off()