setwd("C:/Mangala/Tech/GitHub/ExData_Plotting1")

#Read household power consumption data
pwrcnsmp <- read.table("household_power_consumption.txt",skip=1,sep=";")
#Name household power consumption data
names(pwrcnsmp) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subset household power consumption data
subpwrcnsmp <- subset(pwrcnsmp,pwrcnsmp$Date=="1/2/2007" | pwrcnsmp$Date =="2/2/2007")

#Call basic plot function
hist(as.numeric(as.character(subpwrcnsmp$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")

#Save Plot
dev.copy(png, file = "plot1.png")
dev.off()

