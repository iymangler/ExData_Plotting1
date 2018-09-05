setwd("C:/Mangala/Tech/GitHub/ExData_Plotting1")

#First Plot
png("plot4.png", width=480, height=480)
dev.off()

#Read household power consumption data
pwrcnsmp <- read.table("household_power_consumption.txt",skip=1,sep=";")
#Name household power consumption data
names(pwrcnsmp) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subset household power consumption data
subpwrcnsmp <- subset(pwrcnsmp,pwrcnsmp$Date=="1/2/2007" | pwrcnsmp$Date =="2/2/2007")

#Transform Date and Time into type Date and POSIXlt
subpwrcnsmp$Date <- as.Date(subpwrcnsmp$Date, format="%d/%m/%Y")
subpwrcnsmp$Time <- strptime(subpwrcnsmp$Time, format="%H:%M:%S")
subpwrcnsmp[1:1440,"Time"] <- format(subpwrcnsmp[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpwrcnsmp[1441:2880,"Time"] <- format(subpwrcnsmp[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Initiate a composite plot with many graphs
par(mfrow=c(2,2))

#Call the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subpwrcnsmp,{
  plot(subpwrcnsmp$Time,as.numeric(as.character(subpwrcnsmp$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpwrcnsmp$Time,as.numeric(as.character(subpwrcnsmp$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpwrcnsmp$Time,subpwrcnsmp$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpwrcnsmp,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpwrcnsmp,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpwrcnsmp,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpwrcnsmp$Time,as.numeric(as.character(subpwrcnsmp$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})


