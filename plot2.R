setwd("C:/Mangala/Tech/GitHub/ExData_Plotting1")

#Read household power consumption data
pwrcnsmp <- read.table("household_power_consumption.txt",skip=1,sep=";")
#Name household power consumption data
names(pwrcnsmp) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subset household power consumption data
subpwrcnsmp <- subset(pwrcnsmp,pwrcnsmp$Date=="1/2/2007" | pwrcnsmp$Date =="2/2/2007")

# Transform Date and Time from characters into Date and POSIXlt 
subpwrcnsmp$Date <- as.Date(subpwrcnsmp$Date, format="%d/%m/%Y")
subpwrcnsmp$Time <- strptime(subpwrcnsmp$Time, format="%H:%M:%S")
subpwrcnsmp[1:1440,"Time"] <- format(subpwrcnsmp[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpwrcnsmp[1441:2880,"Time"] <- format(subpwrcnsmp[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Call basic plot function
plot(subpwrcnsmp$Time,as.numeric(as.character(subpwrcnsmp$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")

dev.copy(png, file = "plot2.png")
dev.off()

